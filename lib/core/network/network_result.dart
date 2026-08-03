import 'failure.dart';

sealed class NetworkResult<T> {
  const NetworkResult();
}

class Success<T> extends NetworkResult<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends NetworkResult<T> {
  final Failure failure;
  const Error(this.failure);
}
