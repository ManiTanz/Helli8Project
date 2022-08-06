
import 'package:first_app/User.dart';
import 'package:first_app/buildAppBar.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'User.dart';

void main() => runApp(Profile());

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: UserData(),
    );
  }
}