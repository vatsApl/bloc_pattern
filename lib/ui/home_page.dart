import 'package:bloc_three_params/bloc/user_bloc.dart';
import 'package:bloc_three_params/bloc/user_event.dart';
import 'package:bloc_three_params/bloc/user_state.dart';
import 'package:bloc_three_params/repo/user_repository.dart';
import 'package:bloc_three_params/ui/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userBloc = UserBloc(UserRepository());

  @override
  void initState() {
    super.initState();
    _userBloc.add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (BuildContext context) => _userBloc,
      child: Scaffold(
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text(
                  'Something went wrong',
                ),
              );
            }
            if (state is UsersLoadedState) {
              var list = state.users;
              return ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var userId = list?[index].id;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailsPage(id: userId.toString()),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${list?[index].name}',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is UsersLoadedState) {}
            return Container();
          },
        ),
      ),
    );
  }
}
