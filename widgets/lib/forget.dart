import 'package:flutter/material.dart';
import 'loginpage.dart';
class forget extends StatefulWidget {
  const forget({ Key? key }) : super(key: key);

  @override
  _forgetState createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(
        title: Column(
          children: [
                Image.asset(
          "assets/images/Logo-Red-Green.png", 
          height: 250,
        ),
        
          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
         icon: Icon(
           Icons.arrow_back ,
           color: Color.fromARGB(115, 16, 29 , 39),
         ),
         onPressed: () {
           Navigator.of(context).push(
    PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 950),
    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation ){
      return LoginWidget();
    },
    transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation , Widget child){
      return SlideTransition(
      child: child,
      position: Tween<Offset>(begin: Offset(1 , 0) , end: Offset(0,0)).animate(CurvedAnimation(parent: animation , curve: Curves.easeOutQuad)),
      );
    }
    ),
  );
         },         
       ),
        backgroundColor: (Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: forgetUI(),  
    );
  }
  Widget forgetUI(){
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
    Container(
    child: Column(
      children: [
        Center(
          child:
            Text(
              "فراموشی رمز عبور",
              style: TextStyle(
                fontSize: 30 ,
                color: Color.fromARGB(255, 207, 24, 24),
                fontFamily: 'Vazirmatn',
              ),
            ),
        ),
          ],
    ),
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.only(left: 70 , right: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              child:
                Material(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none ,
                      contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                ),
            ),
                SizedBox(
                height: 20,
                ),
                Container(
                  width: 400,
                  child: Material(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none ,
                        contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
                        hintText: "شماره تلفن",
                        hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.phone_android , color:Color.fromARGB(255, 7, 205, 255) ,
                          ),
                          ),
                      ),
                      obscureText: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  height: 30,) ,
                  Container(
                    width: 400,
                    child: Material(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none ,
                        contentPadding : EdgeInsets.fromLTRB(10, 15, 10, 15),
                        hintText: "ایمیل",
                        hintStyle: TextStyle(fontFamily: 'Vazirmatn'),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.mail , color:Color.fromARGB(255, 7, 205, 255) ,
                          ),
                          ),
                      ),
                      obscureText: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[300],
                ),
                  ),
                SizedBox(
                  height: 30,) , 
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color:Color.fromARGB(255, 7, 205, 255) ,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => const LoginWidget()
                   ));
                        } ,
                        child: Container(
                          height: 40,
                          width: 400,
                          child: Center(
                            child:  Text(
                              "ثبت" , 
                              style: TextStyle(
                                color: Colors.white , 
                                fontSize: 20,
                                fontFamily: 'Vazirnmatn'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 10 , right: 50 , left: 50)
                  ),
                   const Text(
                   ".رمز عبور جدید برای ایمیل شما ارسال شد، حتما بعد از آن اقدام به تغییر رمز عبور کنید",
                   style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),
                   fontSize: 15,
                   fontFamily: 'Vazirmatn'
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