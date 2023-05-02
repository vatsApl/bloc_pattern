import 'package:bloc_three_params/login_bloc/auth_bloc/auth_event.dart';
import 'package:bloc_three_params/login_bloc/auth_bloc/auth_state.dart';
import 'package:bloc_three_params/login_bloc/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepositoryLogin _userRepositoryLogin;
  AuthenticationBloc(this._userRepositoryLogin)
      : assert(_userRepositoryLogin != null),
        super(AuthenticationUninitialized()); //
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Future<Stream<AuthenticationState>?> mapEventToState(
    AuthenticationState currentState,
    AuthenticationEvent event,
  ) async {
    if (event is AppStarted) {
      final bool hasToken = await _userRepositoryLogin.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }

    if (event is LoggedIn) {
      emit(AuthenticationLoading());
      await _userRepositoryLogin.persistToken(event.token);
      emit(AuthenticationAuthenticated());
    }

    if (event is LoggedOut) {
      emit(AuthenticationLoading());
      await _userRepositoryLogin.deleteToken();
      emit(AuthenticationUnauthenticated());
    }
    return null;
  }
}
