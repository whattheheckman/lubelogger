import 'package:lubelogger/core/settings/app_settings.dart';

/// Decides which version wins when local and remote records diverge.
class ConflictResolver {
  ConflictResolver(this.strategy);
  final ConflictStrategy strategy;

  /// Returns true if the [remote] version should win over [local].
  bool remoteWins({
    required DateTime localUpdatedAt,
    required DateTime remoteUpdatedAt,
  }) {
    if (strategy == ConflictStrategy.lastWriteWins) {
      return remoteUpdatedAt.isAfter(localUpdatedAt);
    }
    // For userPrompt, default to last-write-wins; the UI layer presents conflicts.
    return remoteUpdatedAt.isAfter(localUpdatedAt);
  }
}
