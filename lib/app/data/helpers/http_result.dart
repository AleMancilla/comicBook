class HttpResult<T> {
  final T? data;
  final int statusCode;
  final HttpError? error;

  HttpResult({
    required this.data,
    required this.error,
    required this.statusCode,
  });
}

class HttpError {
  final Object? exception;
  final StackTrace stackTrace;
  final dynamic data;

  HttpError({
    required this.exception,
    required this.stackTrace,
    required this.data,
  });
}
