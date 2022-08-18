abstract class Failure {
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(this.message, {this.code});
  final String? message;
  final int? code;
}

class CacheFailure extends Failure {}

String getMessage(Failure failure) {
  if (failure is ServerFailure) {
    return failure.message.toString();
  } else {
    return '';
  }
}

int getCode(Failure failure) {
  if (failure is ServerFailure) {
    return failure.code ?? 0;
  } else {
    return 0;
  }
}
