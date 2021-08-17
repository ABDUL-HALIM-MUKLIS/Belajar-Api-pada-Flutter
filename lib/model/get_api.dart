import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? name;
  String? id;
  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<User> connectToAPI(var id) async {
    Uri apiURL = Uri.parse("https://reqres.in/api/users/" + id);

    var apiResult = await http.get(apiURL);

    var jsonObject = jsonDecode(apiResult.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }

  static Future<List<User>> getUsers(var page) async {
    Uri apiURL = Uri.parse("https://reqres.in/api/users?page=" + page);

    var apiResult = await http.get(apiURL);

    var jsonObject = jsonDecode(apiResult.body);

    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }
    // print(users);
    return users;
  }
}
