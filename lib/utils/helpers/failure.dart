abstract class Failure {
  final String? message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String? message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String? message) : super(message);
}

//For local data source e.g. Hive
class DatabaseFailure extends Failure {
  const DatabaseFailure(String? message) : super(message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String? message) : super(message);
}
