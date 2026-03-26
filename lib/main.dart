import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/settings/settings_repository.dart';
import 'core/settings/tab_layout_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final settingsRepo = SettingsRepository(prefs);
  final tabLayoutRepo = TabLayoutRepository(prefs);

  runApp(
    ProviderScope(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(settingsRepo),
        tabLayoutRepositoryProvider.overrideWithValue(tabLayoutRepo),
      ],
      child: const LubeLoggerApp(),
    ),
  );
}
