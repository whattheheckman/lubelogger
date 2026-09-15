import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lubelogger/core/settings/tab_layout_repository.dart';

class TabLayoutSettingsScreen extends ConsumerStatefulWidget {
  const TabLayoutSettingsScreen({super.key});

  @override
  ConsumerState<TabLayoutSettingsScreen> createState() =>
      _TabLayoutSettingsScreenState();
}

class _TabLayoutSettingsScreenState
    extends ConsumerState<TabLayoutSettingsScreen> {
  late List<TabConfig> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = List.of(ref.read(tabLayoutRepositoryProvider).tabs);
  }

  Future<void> _save() async {
    await ref.read(tabLayoutRepositoryProvider).save(_tabs);
  }

  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _tabs.removeAt(oldIndex);
      _tabs.insert(newIndex, item);
    });
    _save();
  }

  void _toggleVisible(int index, bool value) {
    // Don't allow hiding the last visible tab
    final visibleCount = _tabs.where((c) => c.visible).length;
    if (!value && visibleCount <= 1) return;

    setState(() {
      _tabs[index] = _tabs[index].copyWith(visible: value);
    });
    _save();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tab Layout')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'Drag to reorder tabs. Toggle to show or hide.',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: _tabs.length,
              onReorder: _reorder,
              itemBuilder: (context, i) {
                final tab = _tabs[i];
                return ListTile(
                  key: ValueKey(tab.id),
                  leading: ReorderableDragStartListener(
                    index: i,
                    child: const Icon(Icons.drag_handle),
                  ),
                  title: Text(
                    tab.id,
                    style: tab.visible
                        ? null
                        : TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                  ),
                  trailing: Switch(
                    value: tab.visible,
                    onChanged: (v) => _toggleVisible(i, v),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
