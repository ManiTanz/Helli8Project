import 'package:flutter/material.dart';

class Descriptionpage extends StatelessWidget {
  const Descriptionpage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
         title: const Text(
         "HLS",
         style: TextStyle(color: Color.fromARGB(255, 231, 238, 240),
         fontSize: 70.0
         ),
          ),
        centerTitle:true,
       leading: const Icon(
       Icons.arrow_back,
       color: Color.fromARGB(115, 16, 29, 39),
      ),
      actions: <Widget> [
           IconButton(
           icon: const Icon(Icons.favorite,color:Color.fromARGB(115, 16, 29, 39)), onPressed: () {  },
           )
        ],
        backgroundColor: (Color.fromARGB(255, 7, 205, 255)),
        elevation: 5, 
       ),
       body: Column(
         children:  <Widget>[
           SizedBox(
            height: 20,
           ),
           Align(
             child: Padding(
               padding: EdgeInsets.only(right: 50 , left: 50),
               child: Text(
               "نام درس",
               style: TextStyle(
                 color: Color.fromARGB(255, 13, 241, 203),
                 fontSize: 35
               ),
               ),
             ),
             alignment: Alignment.topCenter,
           ),
           SizedBox(
           height: 80,
           ),
           Center(
           child: Image.network("",
           height: 250,
           width: 250,
           fit: BoxFit.contain,
           ),
           ),
           Text(
          "عنوان درس",
          style: TextStyle(
            color: Color.fromARGB(255, 13, 241, 203) ,
            fontSize: 30
          ),
           ),
           Text(
          "محل توضیحات و.. هر درس",
          style: TextStyle(
            color: Colors.grey[800], 
            fontSize: 20
          ),
           ),
           SizedBox(
            height: 80, 
           ),
           Padding(
             padding: EdgeInsets.only(left: 45 , right: 45),
             child: Text(
           "توضیحات مربوط به آیتم مثل ویژگی فیلم زمان فیلم و..",
            style: TextStyle(
                   color: Colors.grey[600],
                   fontSize: 16,
                   ),
                   textDirection: TextDirection.rtl,
                   textAlign: TextAlign.center,
             ),
           ),
           Expanded(
             child: Padding(
               padding: EdgeInsets.only(bottom: 20),
               child: Align(
                child: Container(
                  decoration: BoxDecoration(
                     color:  Color.fromARGB(255, 7, 205, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ) ,
               child: Center(
                 child: Text("افزودن به علاقه مندی ها" , 
                 style: TextStyle(
                 fontSize: 18 ,
                 ),
                 ),
               ),
                width: MediaQuery.of(context).size.width-50 ,
                height: 70,
                ), 
                alignment: Alignment.bottomCenter,
               ),
             ),
           ),
         ],
       ),
    );
  }
}