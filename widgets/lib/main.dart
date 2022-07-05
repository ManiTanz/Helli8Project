import 'dart:convert';
import 'package:first_app/Profile.dart';
import 'package:first_app/favoritepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'ShopBottomNavigator.dart';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';
import 'UploadContent.dart';


void main() => runApp(const MainMaterial());
class MainMaterial extends StatelessWidget {
    const MainMaterial({ Key? key }) : super(key: key);
    static const appTitle = 'HLS';

  
    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
      title: appTitle,
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
         builder: (context) => const Search(),
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
       body: Padding(
       padding: const EdgeInsets.all(24),
       child: GridView.count(
         crossAxisCount:2,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         children: List.generate(items.length , (int position){
           return generateItem(items[position] , context);
         }),
         ),
       ),
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
              ),
              ),
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