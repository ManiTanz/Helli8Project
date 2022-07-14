import 'dart:ui';

import 'package:first_app/User.dart';
import 'package:first_app/user_prefrenence.dart';
import 'package:flutter/material.dart';
import 'ProfileWidget.dart';
import 'buildAppBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body:
            Container(
              color: Color.fromARGB(255, 7, 205, 255),
              child: Column(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProfileWidget(
                        
                        onClicked: () async {}, img: '',
                      ),
                      const SizedBox(height: 24),
                      buildname(user),
                      const SizedBox(height: 48),
                      buildabout(user),
                    ],
                  ),
                ],
              ),
            ),
        );
  }
  Widget buildname(User user)=> Column(
  children: [
  Text(
   user.name,
   style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24),
  ),
   const SizedBox(height: 4,),
   Text(user.email, 
   style: TextStyle(color: Colors.grey),
   )
  ],
  );
  Widget buildabout(User user)=> Container(
    padding: EdgeInsets.symmetric(horizontal: 48),

  child:
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "بیوگرافی",
        style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold ),
      ),
     const SizedBox(height: 16),
    ],
  ),
  );
  
}