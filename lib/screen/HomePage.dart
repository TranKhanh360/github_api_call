import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic>? repo_lst = [];
  String? name;
  String? imgUrl;
  int? repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tran Khanh App'),
      ),
      body: Column(
        children: [
          //final String n_name =
          Text('username: ' + name.toString()),
          Text('imgURL: ' + imgUrl.toString()),
          Text('public_repo: ' + repo.toString()),
          Text("====DS repo=="),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: action,
      ),
    );
  }

  void action() async {
    print("Tran Khanh called");
    const url =
        "https://api.github.com/users/khanhthach280?Authorization=token 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&=";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      //users = json['login'];
      name = json['login'];
      imgUrl = json['avatar_url'];
      repo = json['public_repos'];
    });
    print("Tran Khanh call completed");
  }
}
