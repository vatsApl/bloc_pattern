abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({
    required this.username,
    required this.password,
  });

  List<Object> get props => [username, password];

  @override
  String toString() =>
      'Login button pressed {username: $username, password: $password,}';
}
