import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'ShopBottomNavigator.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MainMaterial());
class MainMaterial extends StatelessWidget {
    const MainMaterial({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
    debugShowCheckedModeBanner: false,
     home: LoginWidget(), 
      );
    }
  }
void Main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
 
  
    const MyApp({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
    debugShowCheckedModeBanner: false,
     
      );
    }
}
class Store extends StatefulWidget {
   Store({Key? key}) : super(key: key);
  @override
   _StoreState createState() => _StoreState();
   
  }
class _StoreState extends State<Store> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
     
     return  Scaffold(
       appBar: AppBar(
         title:  Text(
         "HLS",
         style: TextStyle(color: Color.fromARGB(255, 231, 238, 240),
         fontSize: 70.0
         ),
          ),
        centerTitle:true,
       leading:  IconButton(
       icon: Icon(Icons.favorite ,
       color: Color.fromARGB(115, 16, 29, 39)
       ),
         onPressed: () {},
       ),
        backgroundColor: (Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
        actions: <Widget> [
           IconButton(
           icon: const Icon(Icons.person_outline,color:Color.fromARGB(115, 16, 29, 39)), onPressed: () {  
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
           )
        ],
       ),
       body: Padding(
       padding: EdgeInsets.all(24),
       child: GridView.count(
         crossAxisCount:1,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         children: List.generate(10 , (int position){
           return generateItem(context);
         }),
         ),
       ),
      bottomNavigationBar: ShopBottomNavigator(),
      floatingActionButton:  FloatingActionButton (backgroundColor: Color.fromARGB(255, 7, 205, 255), onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => const Search ( ) ));
        },
      child: Icon(Icons.search)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
     );  
  }

  void fetchItems() async{
    var url = Uri.parse('https://schema.getpostman.com/json/collection/v2.0.0/collection.json');
    Response response = await get(url);
    print(utf8.decode(response.bodyBytes));
  }
}

Card generateItem(context){
 return Card(
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.all(Radius.circular(40))
   ),
   elevation: 5,
   child: InkWell(
     onTap: (){
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const Descriptionpage()
         ));
     },
       child:Column(
          children: <Widget> [
            Container(
              height: 500,
              child: Image.asset("assets/images/Logo.png"),
            ),
            Container(
              width: 700,
              height: 400,
              child: Image.asset('assets/images/Sample.jpg'),
            ),
            Text(
              "رشته و پایه ",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 82, 2),
                fontSize: 20.0,
                fontFamily: 'Vazirmatn',
              ),),
             Text(
              "عنوان درس ",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 14, 117),
                fontSize: 20.0,
                fontFamily: 'Vazirmatn',
              ),) 
          ],)
   ),
  );
}