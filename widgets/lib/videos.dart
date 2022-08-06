import 'dart:convert';
import 'package:first_app/Profile.dart';
import 'package:first_app/descriptionvideo.dart';
import 'package:first_app/favoritepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'productapload.dart';
import 'UploadContent.dart';
import 'package:http/http.dart' as http;



void Main() => runApp(const videos());
class videos extends StatelessWidget {

  
    const videos({ Key? key }) : super(key: key);
  
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
  List<Productapload> _items=[];
  @override
  void initState() {
    super.initState();
    final response = fetchItems();
    fetchItems();
  }
  
  @override
  Widget build(BuildContext context){
     
     return  Scaffold(
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
   builder: (context) => Profile()
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
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing:10,
          mainAxisSpacing: 15,
          children: List.generate(_items.length, (int position) {
            return generateItem(_items[position], context);
          }),
        ),
      ),
    
    );
  }
Future<void> fetchItems() async{
  final response = await http.get(Uri.parse("http://192.168.43.125:6969/api/product/23"));
  print(response.statusCode);
  var ProuductJson = jsonDecode(response.body);
  print("sag");
  for(var i in ProuductJson){
    // print(i['name']);
    setState(() {
          if(i["img"] == null){
      var ProductItem = Productapload(i['name'], i['id'] , i['author'] , i["img"], i['categories'] , i['desc'], i["podcasts"] , i["videos"],i["date"] , i["exist"]);
    _items.add(ProductItem);
    } else {
    var ProductItem = Productapload(i['name'], i['id'] , i['author'] ,i["img"]  , i['categories'] , i['desc'], i["podcasts"] , i["videos"],i["date"] , i["exist"]);
    _items.add(ProductItem);
    }
    });

  }
}
}

Card generateItem(Productapload productapload, context) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 4,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Descriptionvideos(productapload)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 130,
              height: 130,
              child: Image.network(productapload.img),
            ),
            Text(
              productapload.author,
              style: TextStyle(
                  fontFamily: "Vazirmatn", color: Colors.red[700], fontSize: 16.0),
            ),
            Text(
              productapload.name,
              style: TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Color(0xFF575E67),
                  fontSize: 14.0),
            )
          ],
        ),
      ),
    ),
  );
} 