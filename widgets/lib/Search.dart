import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Padding(        
        padding: const EdgeInsets.only(left: 150 , right: 150 , top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Material(
              child: const TextField(
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
            const SizedBox(
            height: 0,
            ),
          ],
      ),
    ),
    );
  }
}             