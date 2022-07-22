import 'dart:ui';

import 'package:first_app/User.dart';
import 'package:first_app/favoriteitem.dart';
import 'package:first_app/main.dart';
import 'package:first_app/user_prefrenence.dart';
import 'package:flutter/material.dart';
import 'ButtonWidget.dart';
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.img,
            onClicked: () async{},
          ),
          SizedBox(height: 24,),
          buildName(user),
          const SizedBox(height: 24,),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          Center(child: buildAbout(user)),
        ],
      )
  );
  }
  Widget buildName (User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey, fontSize: 25),
      )

    ],
  );
  
  Widget buildUpgradeButton() => ButtonWidget(
    text: 'خانه',
    onClicked: () {
      Navigator.of(context).push(MaterialPageRoute(
   builder: (context) =>  Store()));
    }
  );
  
  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}