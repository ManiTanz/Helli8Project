import 'package:flutter/material.dart';
import 'main.dart';
import 'UploadContent.dart';

class Descriptionpage extends StatelessWidget {
  const Descriptionpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
         title: Image.asset(
          "assets/images/Logo-Red-Green.png", 
          height: 250,
        ),
        centerTitle:true,
       leading:  IconButton(
         icon: const Icon(
           Icons.arrow_back ,
           color: Color.fromARGB(115, 16, 29 , 39),
         ),
         onPressed: () {
           Navigator.of(context).push(
    PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 950),
    pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation ){
      return const MyApp();
    },
    transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondAnimation , Widget child){
      return SlideTransition(
      child: child,
      position: Tween<Offset>(begin: const Offset(1 , 0) , end: const Offset(0,0)).animate(CurvedAnimation(parent: animation , curve: Curves.easeOutQuad)),
      );
    }
    )  
  );
         },     
       ),  
      backgroundColor: (const Color.fromARGB(255, 7, 205, 255)),  
      elevation: 5,
       ),
      body: Column(
        children:  <Widget>[
          const SizedBox(
          height: 20,
          ),
          const Align(
            child:  Padding(
              padding: EdgeInsets.only(right: 50 , left: 50),
              child: Text(
              "نام درس",
              style: TextStyle(
                color: Color.fromARGB(255, 13, 241, 203),
                fontSize: 35,
                fontFamily: 'Vazirmatn',
              ),
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          const SizedBox(
          height: 80,
          ),
          Center(
          child: Image.asset("assets/images/Sample.jpg",
          height: 250,
          width: 250,
          fit: BoxFit.contain,
          ),
          ),
          const Text(
        "عنوان درس",
          style: TextStyle(
            color: Color.fromARGB(255, 13, 241, 203) ,
            fontSize: 30,
            fontFamily: 'Vazirmatn'
          ),
           ),
           Text(
          "محل توضیحات و.. هر درس",
          style: TextStyle(
            color: Colors.grey[800],       
            fontSize: 20,
            fontFamily: 'Vazirmatn'
          ),
           ),
           const SizedBox(
            height: 80, 
           ),
           Padding(
             padding: const EdgeInsets.only(left: 45 , right: 45),
             child: Text(
           "توضیحات مربوط به آیتم مثل ویژگی فیلم زمان فیلم و..",
            style: TextStyle(
                   color: Colors.grey[600],
                   fontSize: 16,
                   fontFamily: 'Vazirmatn',
                   ),
                   textDirection: TextDirection.rtl,
                   textAlign: TextAlign.center,
             ),
           ),
           SizedBox(
            child: ElevatedButton(
              child: const Text("بارگذاری محتوا", 
              style:TextStyle(fontFamily: 'Vazirmatn' , fontSize: 16) ,),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Upload(title: "Upload")))
            ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(bottom: 20),
               child: Align(
                child: Container(
                  decoration: const BoxDecoration(
                     color:  Color.fromARGB(255, 7, 205, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ) ,
               child: const Center(
                child: Text("افزودن به علاقه مندی ها" , 
                style: TextStyle(
                fontSize: 18,
                fontFamily: 'Vazirmatn'
                ),
                ),
               ),
                width: 200 ,
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