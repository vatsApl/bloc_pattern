import 'package:bloc_three_params/login_bloc/auth_bloc/auth_event.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_event.dart';
import 'package:bloc_three_params/login_bloc/bloc/login_state.dart';
import 'package:bloc_three_params/login_bloc/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_bloc/auth_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositoryLogin userRepositoryLogin;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    required this.userRepositoryLogin,
    required this.authenticationBloc,
  })  : assert(userRepositoryLogin != null),
        assert(authenticationBloc != null),
        super(LoginInitial()); //

  @override
  LoginState get initialState => LoginInitial();

  @override
  Future<Stream<LoginState>?> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());
      try {
        final token = await userRepositoryLogin.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    }
    return null;
  }
}
