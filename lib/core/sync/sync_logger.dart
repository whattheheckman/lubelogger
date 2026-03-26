import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SyncLogEntry {
  const SyncLogEntry({required this.timestamp, required this.message});

  final DateTime timestamp;
  final String message;

  static final _fmt = DateFormat('yyyy-MM-dd HH:mm');

  @override
  String toString() => '${_fmt.format(timestamp)} - $message';
}

class SyncLogger {
  final _entries = <SyncLogEntry>[];
  final _controller = StreamController<List<SyncLogEntry>>.broadcast();

  List<SyncLogEntry> get entries => List.unmodifiable(_entries);
  Stream<List<SyncLogEntry>> get stream => _controller.stream;

  void log(String message) {
    _entries.add(SyncLogEntry(timestamp: DateTime.now(), message: message));
    _controller.add(List.unmodifiable(_entries));
  }

  void clear() {
    _entries.clear();
    _controller.add(const []);
  }
}

final syncLoggerProvider = Provider<SyncLogger>((_) => SyncLogger());
