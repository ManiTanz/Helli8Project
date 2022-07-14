import 'dart:io';
import 'package:first_app/User.dart';
import 'package:flutter/material.dart';


class ProfileWidget extends StatelessWidget{
  final String img;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.img,
    this.isEdit = false,
    required this.onClicked,
  })  : super(key: key);
  
  @override
  Widget build(BuildContext context){
    
    return Center(
    child: Stack( 
     children:[
          buildImage(),
         Positioned(bottom: 0, right: 4, child:
           buildediticon(Colors.green),
           
          ),
      
          ],  
      ),
    );
  }
  Widget buildImage(){
    final image = NetworkImage(img);
    
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
            child: InkWell(
              onTap: onClicked,
            ),
            ),
      ),
    );
  }
  Widget buildediticon(Color color) => buildcircle(
    color:Colors.white,
    all: 3,
    child: buildcircle(
     color: color,
    all: 8,
    child:Icon(
    Icons.edit,
    color: Colors.white,
    size: 20,
    ),
  ),
  );
  Widget buildcircle({
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