class UnauthorizedException implements Exception {
  final String? _message;
  UnauthorizedException({String? message}) : _message = message;

  @override
  String toString() {
    return _message ?? 'User was unauthorized.';
  }
}

class UserNotFoundException implements Exception {
  final String? _message;
  UserNotFoundException({String? message}) : _message = message;

  @override
  String toString() {
    return _message ?? 'User was not found.';
  }
}
