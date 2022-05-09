

// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'ShopBottomNavigator.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'serch.dart';




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

// ignore: must_be_immutable
void Main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
    const MyApp({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
    debugShowCheckedModeBanner: false,
     home: Store(), 
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
      // ignore: prefer_const_constructors
      bottomNavigationBar: ShopBottomNavigator(),
      // ignore: prefer_const_constructors
      floatingActionButton:  FloatingActionButton (backgroundColor: Color.fromARGB(255, 7, 205, 255), onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => const search ( ) ));
        },
      child: Icon(Icons.search)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
     
   
     );
  
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
     child: Center(
       child:Column(
         mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget> [
            Container(
              width: 840,
              height: 470,
              child: Image.network("https://wall.patoghu.com/file/56/1600x1200/stretch/%D9%BE%D8%B3-%D8%B2%D9%85%DB%8C%D9%86%D9%87-%D9%85%D8%A7%D8%B4%DB%8C%D9%86-%D9%BE%D9%88%D8%B1%D8%B4%D9%87-%D9%85%D8%B4%DA%A9%DB%8C.jpg"),
   
            ),
            Text(
              "قیمت ",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 82, 2),
                fontSize: 14.0,
              ),),
             Text(
              "عنوان ",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 14, 117),
                fontSize: 14.0,
              ),) 
          
   
          ],)
     ),
   ),
  );
}






    



