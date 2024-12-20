abstract class ApiState<T> {
  final T? data;
  final Exception? exception;

  const ApiState({this.data, this.exception});
}

class ApiLoading<T> extends ApiState<T> {
  const ApiLoading() : super();
}

class ApiIdle<T> extends ApiState<T> {
  const ApiIdle() : super();
}

class ApiSuccess<T> extends ApiState<T> {
  String? message;

  ApiSuccess({this.message, super.data});
}

class ApiException<T> extends ApiState<T> {
  const ApiException(Exception exception) : super(exception: exception);
}
