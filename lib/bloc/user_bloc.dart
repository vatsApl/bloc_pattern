import 'package:bloc_three_params/bloc/user_event.dart';
import 'package:bloc_three_params/bloc/user_state.dart';
import 'package:bloc_three_params/model/user_model.dart';
import 'package:bloc_three_params/repo/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUsersEvent) {
        try {
          emit(UserLoadingState());
          List<UserModel>? users = await _userRepository.getUserList();
          emit(UsersLoadedState(users: users));
          print(users);
        } catch (e) {
          emit(UserErrorState(error: e.toString()));
        }
      }

      if (event is GetUsersDataEvent) {
        try {
          emit(UserLoadingState());
          UserModel? users = await _userRepository.getUser(event.id);
          emit(UserLoadedState(users: users));
        } catch (e) {
          emit(UserErrorState(error: e.toString()));
        }
      }
    });
  }
}
