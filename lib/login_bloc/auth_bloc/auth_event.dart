abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'App Started';
}

class LoggedIn extends AuthenticationEvent {
  final String token;
  LoggedIn({required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn {token: $token}';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
