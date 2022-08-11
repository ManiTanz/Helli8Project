import 'package:first_app/favoritedata.dart';
import 'Profile.dart';
import 'Search.dart';
import 'favoritepage.dart';
import 'loginpage.dart';
import 'main.dart';
import 'productapload.dart';
import 'package:flutter/material.dart';

class DescriptionPodcast extends StatelessWidget {
  Productapload productapload;
  DescriptionPodcast(this.productapload);

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
                          MaterialPageRoute(
                              builder: (context) => const Store()),
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
                      leading: Icon(Icons.search),
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
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/photo1657973117 (2).jpeg"),
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
                  const Align(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "پادکست ",
                        style: TextStyle(
                            fontFamily: "Vazirmatn",
                            color: Color.fromARGB(255, 7, 205, 255),
                            fontSize: 40),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  const SizedBox(
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
                    style: const TextStyle(
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
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 45),
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
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            print("added to basket ${productapload.name}");
                            favoritedata
                                .getInstance()
                                ?.basketItems
                                .add(productapload);
                            print(
                                favoritedata.getInstance()?.basketItems.length);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "${productapload.name} " +
                                      "به علاقه مندی ها افزوده شد",
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: "Vazirmatn")),
                            ));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 7, 205, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Center(
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
          )
        ]));
  }
}
