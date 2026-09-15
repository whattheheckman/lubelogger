# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the app
flutter run

# Run code generation (required after modifying @riverpod, @freezed, or @DriftAccessor annotated classes)
flutter pub run build_runner build

# Watch mode for development
flutter pub run build_runner watch

# Analyze
flutter analyze

# Run all tests
flutter test

# Run a single test file
flutter test test/widget_test.dart
```

## Architecture Overview

LubeLogger is a **local-first Flutter mobile app** for tracking vehicle maintenance records. It uses offline SQLite storage (Drift ORM) with optional cloud sync.

### Feature Structure

Each feature under `lib/features/` follows the same layered pattern:

```
data/       — repository interface + LocalXxxRepository (Drift-backed)
domain/     — Freezed model (immutable, JSON-serializable)
providers/  — @riverpod-annotated providers (code-generated into .g.dart)
screens/    — ConsumerWidget / ConsumerStatefulWidget UI
```

Core infrastructure lives in `lib/core/`:
- `database/` — `AppDatabase` (Drift singleton, schema version), one `*_table.dart` per entity, one `*_dao.dart` per table
- `network/` — Dio client with `AuthInterceptor` (Bearer token) and `CultureInvariantInterceptor`
- `routing/` — GoRouter via `app_router.dart`; use `RouteNames` static methods for all path strings
- `settings/` — `AppSettings` (Freezed, stored in SharedPreferences via `SettingsRepository`)
- `sync/` — `SyncService` push/pull, `SyncLogger`, `SyncStatus` constants
- `widgets/` — shared UI (`DeleteConfirmDialog`, `RecordStatsBanner`)

### State Management: Riverpod

- Use `@riverpod` annotation; always run `build_runner` after changes.
- `StreamProvider` — real-time DB watches (e.g., `gasRecordListProvider(vehicleId)`)
- `StateNotifier` (`@riverpod class XxxNotifier`) — mutations (save / delete)
- `.family` providers accept `vehicleId` or `recordId` from GoRouter path params.
- Key singletons: `appDatabaseProvider`, `apiClientProvider`, `settingsRepositoryProvider`, `syncServiceProvider`.

### Database (Drift)

- `AppDatabase` in `app_database.dart` declares all tables and DAOs; bump `schemaVersion` and add a migration case in `MigrationStrategy.onUpgrade` whenever the schema changes.
- Tables define columns; DAOs expose typed query methods. Never query Drift tables directly from UI or providers — always go through a DAO.
- MPG is **calculated and cached** in `mpg` (nullable column) at write time by `LocalGasRecordRepository._calculateMpg()`. It is `null` for partial fills (`!isFillToFull`) and skipped for `missedFuelUp` records in the next fill's MPG calculation.

### Sync

Records carry a `syncStatus` string field (`synced`, `pending_create`, `pending_update`, `pending_delete`, `sync_failed`). On every write, the repository also enqueues a `SyncQueueCompanion` entry. `SyncService.pushPending()` drains the queue; it is a no-op when `appMode == offline`.

### Gas Records — MPG Calculation

`LocalGasRecordRepository._calculateMpg(r)` in `local_gas_record_repository.dart`:
1. Returns `null` for non-fill-to-full records.
2. Looks up the previous fill-to-full record via `GasRecordsDao.getPreviousFillToFull`.
3. If `missedFuelUp == true`, fetches partial fills between the two mileage points via `getBetweenMileage` and sums their gallons.
4. Returns `deltaMiles / totalGallons`, or `null` if missing data.

`VehicleFuelEconomyReport` (in `vehicle_charts.dart`) filters to `r.mpg != null && r.isFillToFull` before plotting, so missed-fill-up records and non-full fills are already excluded from the chart and stats.

### Navigation

Multi-tab bottom nav (Vehicles / Reminders / Settings) uses `StatefulShellRoute`. Always use `RouteNames` static methods:
```dart
RouteNames.vehicleDetailPath(vehicleId)
RouteNames.vehicleFuelAddPath(vehicleId)
RouteNames.vehicleFuelEditPath(vehicleId, recordId)
```

### UI Patterns

- All Riverpod-aware widgets extend `ConsumerWidget` or `ConsumerStatefulWidget`.
- Use `asyncValue.when(loading:, error:, data:)` for async state.
- `ref.invalidate(provider)` triggers refresh (used in `RefreshIndicator.onRefresh`).
- Swipe-to-delete uses `Dismissible` + `showDeleteConfirmDialog` from `core/widgets/`.
