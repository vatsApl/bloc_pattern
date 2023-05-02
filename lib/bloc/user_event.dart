abstract class UserEvent {}

class GetUsersEvent extends UserEvent {}

class GetUsersDataEvent extends UserEvent {
  String id;
  GetUsersDataEvent({required this.id});
}
