import 'dart:convert';
import 'package:first_app/forget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'loginresponse.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({ Key? key }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var usernameTextController = new TextEditingController();
  var passwordTextController = new TextEditingController();
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
  Widget loginUI(){
    return Stack(
    children: <Widget>[
    Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cool-background-stellar.png"),
          fit: BoxFit.cover
          ),
      ),
    ),
    Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 150 , right: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(
              width: 400,
              child: Material(
                    child: TextField(
                      controller: usernameTextController,
                          decoration: const InputDecoration(
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
              width: 400 ,
              child: Material(
                child: TextField(
                  controller: passwordTextController,
                  decoration: const InputDecoration(
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
                  color:const Color.fromARGB(255, 7, 205, 255) ,
                  child: InkWell(
                    onTap: (){
                    //  loginHttpRequest();
                      login(usernameTextController.text.toString(), passwordTextController.text.toString());
                    } ,
                    child: const SizedBox(
                      height: 40,
                      width: 400,
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
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const forget()
                    ));
    },
          child: const Center(
            child: Text(
              'فراموشی رمز عبور', 
              style: TextStyle(
                  color: Colors.white , 
                  fontSize: 18 ,
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
  
  try{
    
    Response response = await http.post(
      Uri.parse('http://154.91.170.55:8900/api/login/'),
      body: {
        'username' : username,
        'password' : password
      }
    );

    if(response.statusCode == 200){
      
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');
      Navigator.of(context).push(MaterialPageRoute(
   builder: (context) => const Store()));

    }else {
      print('failed');
         void showMySnackBar(BuildContext context,String message){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontFamily: "Vazirmatn",fontSize: 15,),),
      )
    );
    }
    showMySnackBar(context, "نام کاربری یا رمز عبور اشتباه است.");
    }
  }catch(e){
    print(e.toString());
  }
}
  //  void sendLoginRequest({required BuildContext context, required String username,required String password}) async{
  //   var url=Uri(scheme: "http://154.91.170.55:8900/api/login/");
  //   var body=Map<String,dynamic>();
  //   body["username"]=username;
  //   body["password"]=password;
  //   Response response = await http.post(url,body: body);
  //   if(response.statusCode==200){
  //     //successful
  //     var loginJson=json.decode(utf8.decode(response.bodyBytes));
  //     var model=LoginResponseModel(loginJson["result"],loginJson["message"]);
  //     if(model.result==0){
  //       showMySnackBar(context, model.message);
  //     }
  //     else if(model.result==1){
  //       Navigator.of(context).pushReplacement(PageRouteBuilder(
  //           transitionDuration: Duration(milliseconds: 300),
  //           pageBuilder: (BuildContext context,
  //               Animation<double> animation,
  //               Animation<double> secondAnimation) {
  //             return Store();
  //           },
  //           transitionsBuilder: (BuildContext context,
  //               Animation<double> animation,
  //               Animation<double> secondAnimation,
  //               Widget child) {
  //             return ScaleTransition(
  //               child: child,
  //               scale:
  //               Tween<double>(begin: 0, end: 1)
  //                   .animate(CurvedAnimation(
  //                   parent: animation,
  //                   curve: Curves.fastOutSlowIn)),
  //             );
  //           }));
  //     }

  //   }
  //   else{
  //     //error
  //     showMySnackBar(context, "نام کاربری یا رمز عبور اشتباه است.");
  //   }
  // }

  // void showMySnackBar(BuildContext context,String message){
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message,style: TextStyle(fontFamily: "Vazirmatn",fontSize: 15,),),
  //     )
  //   );
  // }
}
