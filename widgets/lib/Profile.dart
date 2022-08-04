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
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 48),
        ],
      ),
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text("Name:"),
          SizedBox(height: 20),
          FutureBuilder<User>(
             future: futureUser,
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 return Text(snapshot.data!.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24));
               } else if (snapshot.hasError) {
                 //print(snapshot.data!.id);
                 print(snapshot.data!.email);
                 //print(snapshot.data!.isStaff);
                 return Text('${snapshot.error}');
               }
               // By default, show a loading spinner.
               return const CircularProgressIndicator();
             },
           ),
          SizedBox(height: 10),
          Text("Email:"),
          const SizedBox(height: 20),
          FutureBuilder<User>(
             future: futureUser,
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 return Text(snapshot.data!.email);
               } 
               else if (snapshot == null){
                print("snapshot is null");
               }
               else if (snapshot.hasError) {
                 return Text('${snapshot.error}');
               }
               // By default, show a loading spinner.
               return const CircularProgressIndicator();
             },
           ),
        ],
      );
    //Center(
    //       child: FutureBuilder<User>(
    //         future: futureUser,
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    //             //return Text(snapshot.data!.email);
    //           } else if (snapshot.hasError) {
    //             return Text('${snapshot.error}');
    //           }
    //           // By default, show a loading spinner.
    //           return const CircularProgressIndicator();
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
class ProfileWidget extends StatelessWidget {


  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Image.asset(
          'assets/images/Sample.jpg',
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }
  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}