import 'package:first_app/favoritedata.dart';
import 'Profile.dart';
import 'Search.dart';
import 'favoritepage.dart';
import 'loginpage.dart';
import 'main.dart';
import 'productapload.dart';
import 'package:flutter/material.dart';

import 'favorite.dart';

class Descriptionvideos extends StatelessWidget {
    Productapload  productapload;
  Descriptionvideos(this.productapload);

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
    builder: (context) => const Store()
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
        centerTitle:true,
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: 
        Stack(
         children:<Widget> [
               Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/photo1657973117 (2).jpeg"),
          fit: BoxFit.cover
          ),
      ),
               ),
           Center(
            child: Builder(
        builder:(context)=> Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "ویدئو",
                  style: TextStyle(
                      fontFamily: "Vazirmatn", color: Color.fromARGB(255, 7, 205, 255), fontSize: 40),
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                productapload.img,
                height: 280,
                width: 280,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              productapload.author,
              style: TextStyle(
                color: Color.fromARGB(255, 7, 205, 255),
                fontFamily: "Vazir",
                fontSize: 30,
              ),
            ),
            Text(
              productapload.name,
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
                productapload.desc,
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
                  padding: EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("added to basket ${productapload.name}");
                      favoritedata.getInstance()?.basketItems.add(productapload);
                      print(favoritedata.getInstance()?.basketItems.length);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${productapload.name} "+"به علاقه مندی ها افزوده شد",
                              style: TextStyle(fontSize: 15,fontFamily: "Vazirmatn")),
                        )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 7, 205, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "افزودن به علاقه مندی ها",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Vazirmatn",
                              fontSize: 18),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 70,
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
           ),
         ]
    )
    );
    
  }
}
