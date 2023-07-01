import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String name;
  String username;
  String email;
  Users({
    required this.name,
    required this.username,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        //username: json["username"],
        username: json["description"],
        //email: json["email"],
        email: json["full_name"],
      );
}

Future<List<Users>> getUsers() async {
  final response = await http.get(
    //Uri.parse('https://jsonplaceholder.typicode.com/users'),
    Uri.parse(
        'https://api.github.com/users/khanhthach280/repos?Authorization=token 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&='),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Users> users = [];
    for (var u in jsonResponse) {
      Users user = Users(
          name: u['name'],
          //username: u['username'],
          username: u['description'],
          //email: u['email']
          email: u['full_name']);
      users.add(user);
    }
    return users;
  } else {
    throw Exception('Failed to load post');
  }
}
