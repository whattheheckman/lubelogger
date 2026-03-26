import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kNotifSettingsKey = 'notification_settings';

class NotificationSettings {
  const NotificationSettings({
    this.enabled = true,
    this.daysBefore = 7,
    this.notifyHour = 9,
    this.notifyMinute = 0,
  });

  final bool enabled;
  final int daysBefore;
  final int notifyHour;
  final int notifyMinute;

  NotificationSettings copyWith({
    bool? enabled,
    int? daysBefore,
    int? notifyHour,
    int? notifyMinute,
  }) =>
      NotificationSettings(
        enabled: enabled ?? this.enabled,
        daysBefore: daysBefore ?? this.daysBefore,
        notifyHour: notifyHour ?? this.notifyHour,
        notifyMinute: notifyMinute ?? this.notifyMinute,
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'daysBefore': daysBefore,
        'notifyHour': notifyHour,
        'notifyMinute': notifyMinute,
      };

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      NotificationSettings(
        enabled: json['enabled'] as bool? ?? true,
        daysBefore: json['daysBefore'] as int? ?? 7,
        notifyHour: json['notifyHour'] as int? ?? 9,
        notifyMinute: json['notifyMinute'] as int? ?? 0,
      );
}

class NotificationSettingsRepository {
  NotificationSettingsRepository(this._prefs);
  final SharedPreferences _prefs;

  NotificationSettings get settings {
    final raw = _prefs.getString(_kNotifSettingsKey);
    if (raw == null) return const NotificationSettings();
    try {
      return NotificationSettings.fromJson(
          json.decode(raw) as Map<String, dynamic>);
    } catch (_) {
      return const NotificationSettings();
    }
  }

  Future<void> save(NotificationSettings s) async {
    await _prefs.setString(_kNotifSettingsKey, json.encode(s.toJson()));
  }
}

final notificationSettingsRepositoryProvider =
    Provider<NotificationSettingsRepository>(
  (_) => throw UnimplementedError('Override in ProviderScope overrides'),
);
