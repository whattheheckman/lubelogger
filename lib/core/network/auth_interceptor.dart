import 'dart:convert';
import 'package:dio/dio.dart';
import '../settings/app_settings.dart';
import '../settings/settings_repository.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._settings);
  final SettingsRepository _settings;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final settings = _settings.current;
    if (settings.authMode == AuthMode.apiKey) {
      options.headers['x-api-key'] = settings.apiKey;
    } else if (settings.authMode == AuthMode.basic) {
      final creds = base64Encode(utf8.encode('${settings.username}:${settings.password}'));
      options.headers['Authorization'] = 'Basic $creds';
    }
    handler.next(options);
  }
}
