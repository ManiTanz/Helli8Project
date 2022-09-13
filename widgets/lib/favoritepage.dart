import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'favoritedata.dart';
import 'favoriteitem.dart';
import 'Search.dart';
import 'Profile.dart';
import 'loginpage.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
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
                          builder: (context) => const Search(),
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
                          MaterialPageRoute(builder: (context) => const Profile()));
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
      body: basketUI(),
    );
  }

  Widget basketUI() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: favoritedata.getInstance()!.basketItems.length,
            itemBuilder: (context, postion) {
              return GestureDetector(
                child: Padding(
                  child: ShoppingBasketItem(
                      favoritedata.getInstance()!.basketItems[postion],
                      removeItem,
                      postion),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      favoritedata.getInstance()!.basketItems.removeAt(index);
    });
  }
}
