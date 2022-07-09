import 'package:flutter/material.dart';

void main() {
runApp(const search());
}

class search extends StatelessWidget {
const search({Key? key}) : super(key: key);

// This is the root widget
// of your application
@override
Widget build(BuildContext context) {
	return MaterialApp(
    debugShowCheckedModeBanner: false,
	title: 'Flutter Demo',
	theme: ThemeData(
	
    
	),
	home: GFG(),
	);
}
}
class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);
 
  @override
  State<GFG> createState() => _GFGState();
}
 
class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Logo-Red-Green.png", 
          height: 250,          
        ),
        centerTitle: true,
        backgroundColor: (const Color.fromARGB(255, 7, 205, 255)), 
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
       padding: const EdgeInsets.all(24),
       child: GridView.count(
         crossAxisCount:2,
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
            children:[
              Row(
                children: [
                  Column(
                    children:[
                      Image.asset('assets/images/Calculus.jpg', width: 100, height: 100,),
                      
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Card(
                    child:
                      Image.asset('assets/images/Probability-and-Statistics.jpg', width: 50, height: 50,),
                      
                  ),
                
                ],
              ),
            ],
           ),
         ),
         
         ); 
    
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries",
    "math",
    "physics",
    "biology",
    "chamistry"
  ];
     
  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }
 
  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
 
  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
 
  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

    
  



