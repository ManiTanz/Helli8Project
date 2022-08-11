import 'dart:convert';
import 'package:first_app/Profile.dart';
import 'package:first_app/favoritepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'descriptionpage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

void main() => runApp(const MainMaterial());

class MainMaterial extends StatelessWidget {
  const MainMaterial({Key? key}) : super(key: key);
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 205, 255),
                image: DecorationImage(
                  image: AssetImage("assets/images/Logo-Red-Green.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(),
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
                  ListTile(
                    title: const Text(
                      "علاقه مندی ها",
                      style: TextStyle(fontFamily: "Vazirmatn"),
                    ),
                    leading: const Icon(Icons.favorite),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const favorite()),
                      );
                    },
                  ),
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
                          builder: (context) => const search(),
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Profile()));
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
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

  Future<void> fetchItems() async {
    final response =
        await http.get(Uri.parse("http://154.91.170.55:8900/api/product/"));
    print(response.statusCode);
    var ProuductJson = jsonDecode(response.body);
    for (var i in ProuductJson) {
      setState(() {
        if (i["img"] == null) {
          var ProductItem = Product(
            i['name'],
            i['id'],
            i['author'],
            "",
            i['categories'],
            i['desc'],
          );
          _items.add(ProductItem);
        } else {
          var ProductItem = Product(
            i['name'],
            i['id'],
            i['author'],
            i["img"],
            i['categories'],
            i['desc'],
          );
          _items.add(ProductItem);
        }
      });
    }
  }
}

Card generateItem(Product product, context) {
  var productAuthorEncode = utf8.encode(product.author);
  var productAuthorDecode = utf8.decode(productAuthorEncode);
  var producNameEncode = utf8.encode(product.name);
  var producNameDecode = utf8.decode(producNameEncode);

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
              width: 130,
              height: 130,
              child: Image.network(product.img),
            ),
            Text(
              productAuthorDecode,
              style: TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Colors.red[700],
                  fontSize: 16.0),
            ),
            Text(
              producNameDecode,
              style: const TextStyle(
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
