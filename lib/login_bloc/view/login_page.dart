import 'package:bloc_three_params/login_bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_bloc.dart';
import 'package:bloc_three_params/login_bloc/user_repository.dart';
import 'package:bloc_three_params/login_bloc/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final UserRepositoryLogin userRepositoryLogin;
  LoginPage({required this.userRepositoryLogin})
      : assert(userRepositoryLogin != null);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  late AuthenticationBloc _authenticationBloc;

  UserRepositoryLogin get _userRepository => widget.userRepositoryLogin;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepositoryLogin: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        centerTitle: true,
      ),
      body: LoginForm(
        loginBloc: _loginBloc,
        authenticationBloc: _authenticationBloc,
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }
}
