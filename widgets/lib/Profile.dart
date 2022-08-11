import 'package:flutter/material.dart';
import 'User.dart';

void main() => runApp(const Profile());

class Profile extends StatefulWidget {
  const Profile({super.key});

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
    return const Scaffold(
      body: UserData(),
    );
  }
}
