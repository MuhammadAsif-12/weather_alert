abstract class DataState<T> {
  final T? data;
  final String? msg;
  final bool? success;
  final Exception? exception;

  const DataState({this.data, this.msg, this.success, this.exception});

  void analyzeSimple(
      {required Function(T? data, String? msg) onSuccess,
      Function(String? msg)? onServerError,
      Function(Exception?)? onError}) {
    if (this is DataSuccess) {
      if (this.success == true) {
        try {
          onSuccess.call(data, msg);
        } catch (e) {
          onError?.call(e.toException()); // Use toException to convert
        }
      } else {
        onServerError?.call(msg);
      }
    } else {
      onError?.call(exception);
    }
  }

  void analyze(
      {required Function(T? data, String? msg) onSuccess,
      Function(T? data, String? msg)? onServerError,
      Function(Exception?)? onError}) {
    if (this is DataSuccess) {
      if (this.success == true) {
        try {
          onSuccess.call(data, msg);
        } catch (e) {
          onError?.call(e.toException()); // Use toException to convert
        }
      } else {
        onServerError?.call(data, msg);
      }
    } else {
      onError?.call(exception);
    }
  }
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data, String? msg, bool? success)
      : super(data: data, msg: msg, success: success);
}

class DataException<T> extends DataState<T> {
  const DataException(Exception exception) : super(exception: exception);
}

extension ToException on Object {
  Exception toException() {
    if (this is Exception) {
      return this as Exception;
    } else {
      return Exception((this as Error).stackTrace.toString());
    }
  }
}
