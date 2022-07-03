import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'ShopBottomNavigator.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';


void main() => runApp(const MainMaterial());
class MainMaterial extends StatelessWidget {
    const MainMaterial({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
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
      return const MaterialApp(
    debugShowCheckedModeBanner: false,
     home: Store(), 
      );
    }
}
class Store extends StatefulWidget {
   const Store({Key? key}) : super(key: key);
  @override
   _StoreState createState() => _StoreState();
   
  }
class _StoreState extends State<Store> {
  List<Product> items=[];
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
     
     return  Scaffold(
       appBar: AppBar(
         title:  const Text(
         "HLS",
         style: TextStyle(color: Color.fromARGB(255, 231, 238, 240),
         fontSize: 70.0
         ),
          ),
        centerTitle:true,
       leading:  IconButton(
       icon: const Icon(Icons.favorite ,
       color: Color.fromARGB(115, 16, 29, 39)
       ),
         onPressed: () {},
       ),
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
        actions: <Widget> [
           IconButton(
           icon: const Icon(Icons.person_outline,color:Color.fromARGB(115, 16, 29, 39)), onPressed: () {  
   Navigator.of(context).push(
    PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 950),
    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation ){
      return const LoginWidget();
    },
    transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation , Widget child){
      return SlideTransition(
      child: child,
      position: Tween<Offset>(begin: const Offset(1 , 0) , end: const Offset(0,0)).animate(CurvedAnimation(parent: animation , curve: Curves.easeOutQuad)),
      );
    }
    ),
  );
             },
           )
        ],
       ),
       body: Padding(
       padding: const EdgeInsets.all(24),
       child: GridView.count(
         crossAxisCount:1,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         children: List.generate(items.length , (int position){
           return generateItem(items[position] , context);
         }),
         ),
       ),
      bottomNavigationBar: const ShopBottomNavigator(),
      floatingActionButton:  FloatingActionButton (backgroundColor: const Color.fromARGB(255, 7, 205, 255), onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => const Search ( ) ));
        },
      child: const Icon(Icons.search)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
     );  
  }

  void fetchItems() async{
    var url = Uri.parse('https://schema.getpostman.com/json/collection/v2.0.0/collection.json');
    Response response = await get(url);
    setState(() {
      var productjson = json.decode(utf8.decode(response.bodyBytes));
      for(var i in productjson){
        var productitem = Product(i["name"], i["id"], i["desc"], i["img"], i["auther"]);
        items.add(productitem);
      }
    });
  }
}

Card generateItem(Product product,context){
 return Card(
   shape: const RoundedRectangleBorder(
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
            SizedBox(
              height: 500,
              child: Image.asset(product.img),
            ),
            SizedBox(
              width: 700,
              height: 400,
              child: Image.asset(product.img),
            ),
            const Text(
              "رشته و پایه ",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 82, 2),
                fontSize: 20.0,
                fontFamily: 'Vazirmatn',
              ),),
             const Text(
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