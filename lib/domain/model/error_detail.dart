class ErrorDetail {
  const ErrorDetail({
    this.errorCode,
    this.message,
    this.traceId,
    this.timestamp,
    this.throwable,
    this.stackTrace,
  });

  final String? errorCode;
  final String? message;
  final String? traceId;
  final DateTime? timestamp;
  final Object? throwable;
  final StackTrace? stackTrace;

  factory ErrorDetail.errorCode() {
    return const ErrorDetail(
      errorCode: 'Error',
    );
  }

  factory ErrorDetail.fatal() {
    return const ErrorDetail(
      throwable: Object(),
      stackTrace: StackTrace.empty,
    );
  }

  List<Object?> get props => [
        errorCode,
        message,
        traceId,
        timestamp,
        throwable,
        stackTrace,
      ];
}
