import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

enum AuthMode { none, apiKey, basic }
enum AppMode { local, connected }
enum ConflictStrategy { lastWriteWins, userPrompt }

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppMode.local) AppMode appMode,
    @Default('') String serverUrl,
    @Default(AuthMode.none) AuthMode authMode,
    @Default('') String apiKey,
    @Default('') String username,
    @Default('') String password,
    @Default(5) int syncIntervalMinutes,
    @Default(ConflictStrategy.lastWriteWins) ConflictStrategy conflictStrategy,
    @Default(false) bool setupComplete,
    @Default(true) bool autoAddOdometerRecords,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
