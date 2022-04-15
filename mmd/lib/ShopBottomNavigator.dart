import 'package:flutter/material.dart';

class ShopBottomNavigator extends StatelessWidget {
  const ShopBottomNavigator({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      
         
         color: Color.fromARGB(255, 250, 250, 250),
        shape: CircularNotchedRectangle(),
         notchMargin: 8.0,
         clipBehavior: Clip.antiAlias,
         child: Container(
           height: 0,
         child: Row(
           mainAxisAlignment:MainAxisAlignment.spaceBetween ,
           children:<Widget> [
             Container(
               height:0,
             
             width: MediaQuery.of(context).size.width/2-20,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
             ),
           ],
         ),
    ),
    );
  }
}
               