import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('http://154.91.170.55:8900/api/profile/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = User.fromJson(jsonDecode(response.body)[0]);
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    throw Exception('Failed to load User');
  }
}

class User {
  final int id;
  final String email;
  final String name;
  final bool isStaff;
  //final String img;
  final List favorite;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.isStaff,
    //required this.img,
    required this.favorite,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      isStaff: json['is_staff'],
      //img: json['img'],
      favorite: json['favorite'],
    );
  }
}

void main() => runApp(const UserData());

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'پروفایل',
            style: TextStyle(
                fontFamily: 'Vazirmatn',
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.cyan]),
            ),          
          child: Column(
            children: [
              const Text(
                ":نام",
                style: TextStyle(
                  fontFamily: 'Vazirmatn',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 192, 48),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder<User>(
                  future: futureUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.name,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 192, 18),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ':ایمیل',
                style: TextStyle(
                  fontFamily: 'Vazirmatn',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 192, 48),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder<User>(
                  future: futureUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.email,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 192, 18),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              // Center(
              //   child: FutureBuilder<User>(
              //     future: futureUser,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return Column(
              //           children: [
              //             const Text(
              //               ":علاقه مندی ها",
              //               style: TextStyle(
              //                 fontFamily: "Vazirmatn",
              //               ),
              //             ),
              //             Text(snapshot.data!.name),
              //           ],
              //         );
              //       } else if (snapshot.hasError) {
              //         return Text('${snapshot.error}');
              //       }

              //       // By default, show a loading spinner.
              //       return const CircularProgressIndicator();
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
