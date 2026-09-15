import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_settings.dart';

part 'settings_repository.g.dart';

const _kSettingsKey = 'app_settings';

class SettingsRepository {
  SettingsRepository(this._prefs);
  final SharedPreferences _prefs;

  AppSettings get current {
    final raw = _prefs.getString(_kSettingsKey);
    if (raw == null) return const AppSettings();
    try {
      return AppSettings.fromJson(json.decode(raw) as Map<String, dynamic>);
    } catch (_) {
      return const AppSettings();
    }
  }

  Future<void> save(AppSettings settings) async {
    await _prefs.setString(_kSettingsKey, json.encode(settings.toJson()));
  }
}

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  throw UnimplementedError('Override in ProviderScope overrides');
}
