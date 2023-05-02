import 'dart:convert';
import 'package:bloc_three_params/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String userUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<List<UserModel>?> getUserList() async {
    List<UserModel> users = [];
    try {
      var response = await http.get(Uri.parse(userUrl));
      if (response.statusCode == 200) {
        users = userFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
    return users;
  }

  Future<UserModel?> getUser(String id) async {
    var users;
    try {
      var response = await http.get(Uri.parse('$userUrl/$id'));
      users = UserModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
    }
    return users; // name got null bcoz return was null
  }
}
