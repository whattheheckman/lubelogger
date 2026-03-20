import 'package:dio/dio.dart';

/// Adds the `culture-invariant: true` header to every request so that
/// LubeLogger always formats decimals with `.` and dates as `yyyy-MM-dd`.
class CultureInvariantInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['culture-invariant'] = 'true';
    handler.next(options);
  }
}
