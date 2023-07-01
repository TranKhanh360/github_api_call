import 'package:repo_list/api_call.dart';
import 'package:flutter/material.dart';
import 'package:repo_list/screen/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Users>> users;

  @override
  void initState() {
    // TODO: implement initState//
    super.initState();
    users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Api Calls in Flutter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 150,
            child: FutureBuilder<List<Users>>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(snapshot.data![index].email),
                            trailing: Text(snapshot.data![index].username),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          Container(
            width: 410,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: HomePage(),
          )

          //HomePage(),
        ],
      ),
    ));
  }
}
