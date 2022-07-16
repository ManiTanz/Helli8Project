
import 'package:first_app/padkast.dart';
import 'package:first_app/videos.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:first_app/Profile.dart';
import 'package:first_app/favoritepage.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';
import 'UploadContent.dart';
import 'package:http/http.dart' as http;




class DescriptionPage extends StatelessWidget {
  Product product;
  DescriptionPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
        child: ListView(addAutomaticKeepAlives: true,
        children:[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 7, 205, 255),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/Logo-Red-Green.png"
                ),
                fit: BoxFit.cover,
             ),
              ), 
              child: Center(

              ),
          ),
         Container(
            color: Color.fromARGB(255, 243, 255, 78),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "خانه",
                  style: TextStyle(
                      fontFamily: "Vazirmatn"
                      ),
                    ),
              leading: Icon(
                  Icons.home
                  ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const MyApp()
         ),
         );
                },
                ),
                ListTile(
                  title: Text(
                    "علاقه مندی ها",
                    style: TextStyle(
                      fontFamily: "Vazirmatn"
                      ),
                      ),  
                leading: Icon(
                  Icons.favorite
                  ),
           onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
   builder: (context) => const favorite()
         ),
         );
                },
                ),
                ListTile(
                  title: Text(
                    "جست و جو",
                    style: TextStyle(
                      fontFamily: "Vazirmatn",
                      ),
                      ), 
                          leading: Icon(
                            Icons.search
                            ),
           onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const search(),
                ),
                  );
                },
                          ),
                ListTile(
                  title: Text(
                    "پروفایل",
                    style: TextStyle(
                      fontFamily: "Vazirmatn"
                      ),
                      ),  
               leading: Icon(
                  Icons.person
                  ),
            onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
   builder: (context) => const Profile()
         ));
                },
                ),
                ListTile(
                  title: Text(
                    "خروج",
                    style: TextStyle(
                      fontFamily: "Vazirmatn",
                      ),
                      ), 
                          leading: Icon(
                            Icons.logout
                            ),
       onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const LoginWidget(),
                  ),
                  );
                },
                          ),
              ],
     ),
          ),
        ],
      ),
      ),
      appBar: AppBar(
          title: Image.asset(
          "assets/images/Logo-Red-Green.png", 
          height: 250,          
        ),
        centerTitle: true,
       
       
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),      
      
      body: 
       Builder(
        
        builder:(context)=> Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "درس",
                  style: TextStyle(
                      fontFamily: "Vazirmatn", color: Colors.red[700], fontSize: 40),
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                product.img,
                height: 280,
                width: 280,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              product.author,
              style: TextStyle(
                color: Colors.red[700],
                fontFamily: "Vazirmatn",
                fontSize: 30,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: "Vazirmatn",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, right: 45),
              child: Text(
                product.desc,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontFamily: "Vazirmatn",
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                child: Padding(
                
                
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(40),
                  color:const Color.fromARGB(255, 7, 205, 255) ,
                  child: InkWell(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const videos()
                    ));
                    },
                    child: const SizedBox(
                      height: 40,
                      width: 400,
                      child: Center(
                        child:  Text(
                          "ویدئو ها" , 
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
                ) 
                
                  
                ),
                Expanded(  child:
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(40),
                  color:const Color.fromARGB(255, 7, 205, 255) ,
                  child: InkWell(
                    onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const padkast()
                    ));
                    } ,
                    child: const SizedBox(
                      height: 40,
                      width: 400,
                      child: Center(
                        child:  Text(
                          "پادکست ها" , 
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
                
                )
                
                
               
              
            
          ],
        ),
      ),
    );
  }
}
