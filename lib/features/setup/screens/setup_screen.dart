import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/settings/app_settings.dart';
import 'package:lubelogger/core/settings/settings_repository.dart';

class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  Future<void> _selectMode(AppMode mode) async {
    final repo = ref.read(settingsRepositoryProvider);
    final current = repo.current;
    await repo.save(current.copyWith(appMode: mode, setupComplete: true));
    if (mounted) context.go(RouteNames.vehicles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.oil_barrel, size: 80),
              const SizedBox(height: 24),
              Text(
                'LubeLogger',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Vehicle Maintenance Tracker',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              FilledButton.icon(
                icon: const Icon(Icons.phone_android),
                label: const Text('Use Locally (Offline)'),
                onPressed: () => _selectMode(AppMode.local),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                icon: const Icon(Icons.cloud),
                label: const Text('Connect to LubeLogger Server'),
                onPressed: () => _selectMode(AppMode.connected),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
