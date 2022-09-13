import 'dart:convert';
import 'package:first_app/Podcast.dart';
import 'package:first_app/descriptionvideo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:first_app/Profile.dart';
import 'package:first_app/favoritepage.dart';
import 'loginpage.dart';
import 'Search.dart';
import 'product.dart';
import 'UploadContent.dart';

class DescriptionPage extends StatelessWidget {
  Product product;
  DescriptionPage(this.product);

  @override
  Widget build(BuildContext context) {
    var productNameEncode = utf8.encode(product.name);
    var productNameDecode = utf8.decode(productNameEncode);
    var productDescEncode = utf8.encode(product.desc);
    var productDescDecode = utf8.decode(productDescEncode);

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
                        MaterialPageRoute(builder: (context) => const MyApp()),
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
        title: Image.asset(
          "assets/images/Logo-Red-Green.png",
          height: 250,
        ),
        centerTitle: true,
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),
        elevation: 5,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/cool-background-ether.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Builder(
              builder: (context) => Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
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
                    product.author.toString(),
                    style: TextStyle(
                      color: Colors.red[700],
                      fontFamily: "Vazirmatn",
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    utf8.decode(productNameDecode.runes.toList()),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: "Vazirmatn",
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 45),
                    child: Text(
                      utf8.decode(productDescDecode.runes.toList()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Vazirmatn",
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(255, 7, 205, 255),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const VideoList()));
                          },
                          child: const SizedBox(
                            height: 60,
                            width: 250,
                            child: Center(
                              child: Text(
                                "ویدئو ها",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Vazirmatn',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromARGB(255, 7, 205, 255),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Podcast()));
                          },
                          child: const SizedBox(
                            height: 60,
                            width: 250,
                            child: Center(
                              child: Text(
                                "پادکست ها",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Vazirmatn',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 7, 205, 255),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilePickerDemo()));
                        },
                        child: const SizedBox(
                          height: 60,
                          width: 250,
                          child: Center(
                            child: Text(
                              "بارگذاری محتوا",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Vazirmatn',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
