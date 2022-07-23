import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class User {
  final String img;
  final String name;
  final String email;
  final String about;
  const User({
    required this.img,
    required this.name,
    required this.email,
    required this.about
  });
}


Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://154.91.170.55:8900/api/profile/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = Album.fromJson(jsonDecode(response.body)[0]);
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String email;
  final String name;
  final bool isStaff;
  //final String img;
  final List favorite;

  const Album({
    required this.id,
    required this.email,
    required this.name,
    required this.isStaff,
    //required this.img,
    required this.favorite,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
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
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.email);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}