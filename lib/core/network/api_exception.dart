/// Typed error hierarchy for API failures.
sealed class ApiException implements Exception {
  const ApiException(this.message);
  final String message;
  @override
  String toString() => '$runtimeType: $message';
}

class NetworkException extends ApiException {
  const NetworkException(super.message);
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException(super.message);
}

class NotFoundException extends ApiException {
  const NotFoundException(super.message);
}

class ServerException extends ApiException {
  const ServerException(super.message);
}

class TimeoutException extends ApiException {
  const TimeoutException(super.message);
}
