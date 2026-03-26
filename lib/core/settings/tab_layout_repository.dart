import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kTabLayoutKey = 'tab_layout';

/// Stable IDs for every vehicle detail tab, in default order.
const kDefaultTabOrder = [
  'Overview',
  'Fuel',
  'Service',
  'Repairs',
  'Upgrades',
  'Planner',
  'Reminders',
  'Odometer',
  'Taxes',
  'Supplies',
  'Notes',
  'Reports',
];

class TabConfig {
  const TabConfig({required this.id, required this.visible});

  final String id;
  final bool visible;

  TabConfig copyWith({bool? visible}) =>
      TabConfig(id: id, visible: visible ?? this.visible);

  Map<String, dynamic> toJson() => {'id': id, 'visible': visible};

  factory TabConfig.fromJson(Map<String, dynamic> json) => TabConfig(
        id: json['id'] as String,
        visible: json['visible'] as bool? ?? true,
      );
}

class TabLayoutRepository {
  TabLayoutRepository(this._prefs);
  final SharedPreferences _prefs;

  List<TabConfig> get tabs {
    final raw = _prefs.getString(_kTabLayoutKey);
    if (raw == null) return _defaults();
    try {
      final list = json.decode(raw) as List<dynamic>;
      final saved = list
          .map((e) => TabConfig.fromJson(e as Map<String, dynamic>))
          .toList();
      // Append any tabs added since the user last saved (new features)
      final savedIds = saved.map((c) => c.id).toSet();
      final extras = kDefaultTabOrder
          .where((id) => !savedIds.contains(id))
          .map((id) => TabConfig(id: id, visible: true));
      return [...saved, ...extras];
    } catch (_) {
      return _defaults();
    }
  }

  List<TabConfig> get visibleTabs => tabs.where((c) => c.visible).toList();

  Future<void> save(List<TabConfig> tabs) async {
    await _prefs.setString(
      _kTabLayoutKey,
      json.encode(tabs.map((c) => c.toJson()).toList()),
    );
  }

  static const _hiddenByDefault = {'Taxes', 'Planner', 'Supplies', 'Odometer', 'Reports'};

static List<TabConfig> _defaults() =>
    kDefaultTabOrder
        .map((id) => TabConfig(id: id, visible: !_hiddenByDefault.contains(id)))
        .toList();

}

final tabLayoutRepositoryProvider = Provider<TabLayoutRepository>(
  (_) => throw UnimplementedError('Override in ProviderScope overrides'),
);
