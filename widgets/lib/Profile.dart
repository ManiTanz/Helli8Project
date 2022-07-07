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
                        imagePath: user.imagePath,
                        onClicked: () async {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
        );
  }
}