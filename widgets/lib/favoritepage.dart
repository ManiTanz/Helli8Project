import 'package:flutter/material.dart';
import 'main.dart';
import 'favoritedata.dart';
import 'favoriteitem.dart';
class favorite extends StatefulWidget {
  const favorite({ Key? key }) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:  Text(
        
         "علاقه مندی ها",
         
         style: TextStyle(color: Color.fromARGB(255, 231, 238, 240),
         fontSize: 30.0,
         fontFamily: 'Vazirmatn',
         ),
         ),
          centerTitle:true,
       leading:  IconButton(
       icon: Icon(Icons.home ,
       color: Color.fromARGB(115, 16, 29, 39)
       ),
         onPressed: () {
           Navigator.of(context).push(
    PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 950),
    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation ){
      return MyApp();
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
       ),
       body: basketUI(),
    );
  }

  Widget basketUI() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: ShoppingBasketData.getInstance().basketItems.length,
            itemBuilder: (context, postion) {
              return GestureDetector(
                child: Padding(
                  child: ShoppingBasketItem(
                      ShoppingBasketData.getInstance().basketItems[postion],
                      removeItem,
                      postion),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: Center(
                  child: Text(
                    "پرداخت",
                    style: TextStyle(
                        fontFamily: "Vazir", fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketData.getInstance().basketItems.removeAt(index);
    });
  }
}
