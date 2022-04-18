import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
Future<int> loginRequest() async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ورود",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back ,
          color: Color.fromARGB(115, 16, 29, 39),

        ),
        backgroundColor: (Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: loginUI(),
      
    );
  }
  Widget loginUI(){
    return Stack(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.only(left: 20 , top: 50 ),
    child: Text(
      "Sign In",
      style: TextStyle(
        fontSize: 55 ,
        color: Color.fromARGB(255, 7, 205, 255),
        
      ),
    ),
    
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.only(left: 70 , right: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Material(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none ,
                  contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
                  hintText: "نام کاربری",
                  icon: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.perm_identity , color:Color.fromARGB(255, 7, 205, 255) ,
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
            height: 20,
            ),
            Material(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none ,
                  contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
                  hintText: "رمز عبور",
                  icon: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.lock_outline , color:Color.fromARGB(255, 7, 205, 255) ,
                    ),
                    ),
                ),
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              shadowColor: Colors.grey[300],
            ),
            SizedBox(
              height: 30,
              ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(40),
                  color:Color.fromARGB(255, 7, 205, 255) ,
                  child: InkWell(
                    onTap: (){} ,
                    child: Container(
                      height: 70,
                      child: Center(
                        child:  Text(
                          "ورود" , 
                          style: TextStyle(
                            color: Colors.white , 
                            fontSize: 20 ,
                          ),
                        ),
                      ),                      
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
    onPressed: () {},
    child: const Text('Simple Button'),
    ),
              ),
          ],
        ),
      ),
    ),
    ],
    );
  }
}