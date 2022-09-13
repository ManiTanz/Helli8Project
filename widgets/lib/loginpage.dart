import 'dart:convert';
import 'package:first_app/forget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Logo-Red-Green.png",
          height: 250,
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: loginUI(),
    );
  }

  Widget loginUI() {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/cool-background-stellar.png"),
                fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 400,
                  child: Material(
                    child: TextField(
                      controller: usernameTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                        hintText: "نام کاربری",
                        hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.perm_identity,
                            color: Color.fromARGB(255, 7, 205, 255),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[300],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 100,
                ),
                SizedBox(
                  width: 400,
                  child: Material(
                    child: TextField(
                      controller: passwordTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        hintText: "رمز عبور",
                        hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.lock_outline,
                            color: Color.fromARGB(255, 7, 205, 255),
                          ),
                        ),
                      ),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[300],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 7, 205, 255),
                    child: InkWell(
                      onTap: () {
                        //  loginHttpRequest();
                        login(usernameTextController.text.toString(),
                            passwordTextController.text.toString());
                      },
                      child: const SizedBox(
                        height: 40,
                        width: 400,
                        child: Center(
                          child: Text(
                            "ورود",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Vazirmatn',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const forget()));
                      },
                      child: const Center(
                        child: Text(
                          'فراموشی رمز عبور',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Vazirmatn',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void login(String username, password) async {
    try {
      Response response = await http.post(
          Uri.parse('http://154.91.170.55:8900/api/login/'),
          body: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Store()));
      } else {
      print('failed');
      // AlertDialog(
      //   title: const Text('AlertDialog Title'),
      //   content: SingleChildScrollView(
      //     child: ListBody(
      //       children: const <Widget>[
      //         Text('This is a demo alert dialog.'),
      //         Text('Would you like to approve of this message?'),
      //       ],
      //     ),
      //   ),
      //   actions: <Widget>[
      //     TextButton(
      //       child: const Text('Approve'),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)), 
            child: SizedBox(
              height: 100,
              width: 80,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '!نام کاربری یا رمز عبور اشتباه است' , hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Vazirmatn',
                            )),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "بستن",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Vazirmatn',                             
                              ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1BC0C5),
                          )
                        ),
                    ],
                  ),
              ),
            ),
          );
        });
       }
    } catch (e) {
      print(e.toString());
    }
  }
}
