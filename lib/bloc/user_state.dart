import '../model/user_model.dart';

abstract class UserState {}

class UserLoadingState extends UserState {}

class UsersLoadedState extends UserState {
  List<UserModel>? users;
  UsersLoadedState({this.users});
}

class UserLoadedState extends UserState {
  UserModel? users;
  UserLoadedState({this.users});
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState({required this.error});
}
