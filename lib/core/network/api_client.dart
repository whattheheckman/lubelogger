import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../settings/settings_repository.dart';
import 'auth_interceptor.dart';
import 'culture_invariant_interceptor.dart';
import 'api_exception.dart';

part 'api_client.g.dart';

@riverpod
Dio apiClient(ApiClientRef ref) {
  final settingsRepo = ref.watch(settingsRepositoryProvider);
  final baseUrl = settingsRepo.current.serverUrl;

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl.isEmpty ? 'http://localhost' : baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(settingsRepo),
    CultureInvariantInterceptor(),
  ]);

  // Map Dio errors to typed ApiException
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: const TimeoutException('Request timed out'),
            ),
          );
          return;
        }
        final status = e.response?.statusCode;
        if (status == 401 || status == 403) {
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: const UnauthorizedException('Unauthorized'),
              response: e.response,
            ),
          );
          return;
        }
        if (status == 404) {
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: const NotFoundException('Not found'),
              response: e.response,
            ),
          );
          return;
        }
        if (status != null && status >= 500) {
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: ServerException('Server error: $status'),
              response: e.response,
            ),
          );
          return;
        }
        handler.next(e);
      },
    ),
  );

  return dio;
}
