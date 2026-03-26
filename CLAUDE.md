# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the app
flutter run

# Run code generation (required after modifying annotated providers or models)
flutter pub run build_runner build

# Watch mode for development
flutter pub run build_runner watch

# Analyze
flutter analyze

# Tests
flutter test
```

## Architecture Overview

LubeLogger is a **local-first Flutter mobile app** for tracking vehicle maintenance records. It uses offline SQLite storage with optional cloud sync.

### Directory Structure

```
lib/
  core/
    database/     # Drift ORM setup, AppDatabase singleton, DAOs (12 tables)
    network/      # Dio HTTP client with AuthInterceptor, CultureInvariantInterceptor
    routing/      # GoRouter configuration (RouteNames, app_router.dart)
    settings/     # AppSettings (Freezed), SettingsRepository (SharedPreferences)
    sync/         # SyncService — push/pull with exponential backoff retry
    utils/
    widgets/      # Shared UI (e.g., delete confirmation dialog)
  features/
    vehicles/     # Central entity; all other records belong to a vehicle
    service_records/ repair_records/ upgrade_records/ gas_records/
    odometer/ tax_records/ reminders/ planner/ supplies/ notes/ reports/
    settings/ setup/
```

Each feature follows: `data/` (repository + DB adapters) → `domain/` (Freezed models) → `providers/` (Riverpod) → `screens/` (UI).

### State Management: Riverpod with Code Generation

Providers use `@riverpod` annotation and are code-generated. Always run `build_runner` after changing annotated classes.

- **StreamProvider** — real-time DB watches (e.g., `vehicleListProvider`, `vehicleByIdProvider`)
- **FutureProvider** — async computed values
- **StateNotifier** — mutations (`addVehicle`, `updateVehicle`, `deleteVehicle`)
- **`.family`** — providers parameterized by vehicle ID or record ID

Key singletons injected via Riverpod: `appDatabaseProvider`, `apiClientProvider`, `settingsRepositoryProvider`, `syncServiceProvider`.

### Navigation: GoRouter

Multi-tab bottom nav (Vehicles / Reminders / Settings) using `StatefulShellRoute`. Use `RouteNames` abstract class for type-safe path strings:

```dart
RouteNames.vehicles
RouteNames.vehicleDetailPath(vehicleId)
RouteNames.vehicleServiceAddPath(vehicleId)
```

Nested routes use `/{vehicleId}` path parameters passed into `.family` providers.

### Local-First Sync

`SyncService` manages push (local→remote) and pull (remote→local) via a `SyncQueue` table. Entities are tagged with `SyncStatus` constants: `pending_create`, `pending_update`, `pending_delete`, `synced`, `sync_failed`. Retry uses exponential backoff (30s → 2m → 8m). App mode (`offline` / `connected`) controls sync eligibility.

### UI Patterns

- **`ConsumerWidget`** — standard widget base for Riverpod access
- **`AsyncValue.when()`** — handle loading/error/data states
- **`RefreshIndicator`** — pull-to-refresh calls `ref.invalidate(provider)`
