import 'package:bloc_three_params/login_bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_bloc/auth_event.dart';

class HomePageLogin extends StatelessWidget {
  const HomePageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // logout process
            authenticationBloc.add(LoggedOut());
            //There were core api changes introduced into 1.0.0:
            // bloc.state.listen -> bloc.listen
            // bloc.currentState -> bloc.state
            // bloc.dispatch -> bloc.add
            // bloc.dispose -> bloc.close
          },
          child: Text('logout'),
        ),
      ),
    );
  }
}
