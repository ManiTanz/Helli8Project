import 'dart:convert';
import 'package:first_app/Profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MainMaterial());

class MainMaterial extends StatelessWidget {
  const MainMaterial({Key? key}) : super(key: key);
  static const appTitle = 'HLS';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

void Main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  int idFuture = 0;

  List<Product> _items = [];
  @override
  void initState() {
    super.initState();
    final response = fetchItems();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          addAutomaticKeepAlives: true,
          children: [
            GestureDetector(
              onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Store()));
              },
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 7, 205, 255),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Logo-Red-Green.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 243, 255, 78),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "خانه",
                      style: TextStyle(fontFamily: "Vazirmatn"),
                    ),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Store()),
                      );
                    },
                  ),
                  // ListTile(
                  //   title: const Text(
                  //     "علاقه مندی ها",
                  //     style: TextStyle(fontFamily: "Vazirmatn"),
                  //   ),
                  //   leading: const Icon(Icons.favorite),
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //           builder: (context) => const favorite()),
                  //     );
                  //   },
                  // ),
                  ListTile(
                    title: const Text(
                      "جست و جو",
                      style: TextStyle(
                        fontFamily: "Vazirmatn",
                      ),
                    ),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "پروفایل",
                      style: TextStyle(fontFamily: "Vazirmatn"),
                    ),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Profile()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "خروج",
                      style: TextStyle(
                        fontFamily: "Vazirmatn",
                      ),
                    ),
                    leading: const Icon(Icons.logout),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('userPreference');
                      await Future.delayed(const Duration(seconds: 2));

                      Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginWidget(),
                        ),

                        // this function should return true when we're done removing routes
                        // but because we want to remove all other screens, we make it
                        // always return false
                        (Route route) => false,
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
        title: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Store()));
          },
          child: Image.asset(
            "assets/images/Logo-Red-Green.png",
            height: 250,
          ),
        ),
        centerTitle: true,
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          children: List.generate(_items.length, (int position) {
            return generateItem(_items[position], context);
          }),
        ),
      ),
    );
  }


Future<void> fetchAutor(int id) async {
    final response =
        await http.post((Uri.parse("http://154.91.170.55:8900/api/lili/")),
    body: {'id': id,});
    if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
          var idFuture = id;
      }
    }
    
  Future<void> fetchItems() async {
    final response =
        await http.get(Uri.parse("http://154.91.170.55:8900/api/product/"));
    print(response.statusCode);
    var ProuductJson = jsonDecode(response.body);
    for (var i in ProuductJson) {
      setState(() {
        var ProductItem = Product(
          i['name'],
          i['id'],
          i['author'],
          i["img"],
          i['categories'],
          i['desc'],
          i['topic'],
        );
        _items.add(ProductItem);
      });
    }
    print(_items[0].img);
  }
  Card generateItem(Product product, context) {
  var productTopicEncode = utf8.encode(product.topic);
  var productTopicDecode = utf8.decode(productTopicEncode);
  var stringId = idFuture;

  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 4,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DescriptionPage(product)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 180,
              height: 180,
              child: Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
              ),
            ),
            Text(
              stringId.toString(),
              style: TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Colors.red[700],
                  fontSize: 40.0),
            ),
            Text(
              utf8.decode(productTopicDecode.runes.toList()),
              style: const TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Color(0xFF575E67),
                  fontSize: 38.0),
            )
          ],
        ),
      ),
    ),
  );
}
}