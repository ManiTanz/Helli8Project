
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({ Key? key }) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Padding(        
        padding: EdgeInsets.only(left: 150 , right: 150 , top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Material(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none ,
                  contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
                  hintText: "جست و جو...",
                  hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
                  icon: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.search ,
                       color:Color.fromARGB(255, 24, 28, 29) ,
                    ),
                    ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              shadowColor: Colors.grey[300],
            ) ,
            SizedBox(
            height: 0,
            ),
          ],
      ),
    ),
    );
  }
}  
              