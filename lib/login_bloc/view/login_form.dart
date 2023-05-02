import 'package:bloc_three_params/login_bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_bloc.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_event.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  late LoginBloc loginBloc;
  late AuthenticationBloc authenticationBloc;

  LoginForm({
    required this.loginBloc,
    required this.authenticationBloc,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, state) {
        // if (state is LoginFailure) {
        //   return _onWidgetDidBuild(() {
        //     Scaffold.of(context).
        //   });
        // }
        return Container();
      },
    );
  }

  Widget? _onWidgetDidBuild(Null Function() param0) {
    return Container();
  }
}
