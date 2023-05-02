import 'package:bloc_three_params/bloc/user_bloc.dart';
import 'package:bloc_three_params/bloc/user_event.dart';
import 'package:bloc_three_params/bloc/user_state.dart';
import 'package:bloc_three_params/repo/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  String id;
  UserDetailsPage({required this.id});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _userdetailsBloc = UserBloc(UserRepository());

  @override
  void initState() {
    super.initState();
    _userdetailsBloc.add(GetUsersDataEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UserBloc>(
        create: (context) => _userdetailsBloc,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text('Something went wrong'),
              );
            }
            if (state is UserLoadedState) {
              var user = state.users;
              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('${user?.name}'),
                        subtitle: Text('${user?.address?.city}'),
                      ),
                      Text('${user?.company?.name}'),
                      Text('${user?.phone}'),
                      Text('${user?.website}'),
                      Text('${user?.address?.street}'),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
