import 'package:first_app/forget.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({ Key? key }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ورود",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Vazirmatn'
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
        padding: EdgeInsets.only(left: 150 , right: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Material(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none ,
                  contentPadding : EdgeInsets.fromLTRB(10, 8, 10, 8),
                  hintText: "نام کاربری",
                  hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
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
                  hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
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
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const MyApp()
         ));
                    } ,
                    child: Container(
                      height: 70,
                      child: Center(
                        child:  Text(
                          "ورود" , 
                          style: TextStyle(
                            color: Colors.white , 
                            fontSize: 20 ,
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
                child: TextButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const forget()
         ));
    },
    child: const Text('فراموشی رمز عبور'),
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