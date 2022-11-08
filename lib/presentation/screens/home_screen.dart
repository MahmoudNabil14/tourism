import 'package:flutter/material.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final List<Map> categories = [
    {
      'name':"Coastal Excursions",
      'imageUrl':"https://images.prismic.io/mystique/24d6af7e-53ba-47c4-baef-da7de5b49130_86c7e78d-48e2-4414-9c99-60c5ca83c906-13944-cairo-skip-the-line-tickets---pyramids-of-giza-01.webp?auto=compress%2Cformat&rect=0%"
          "2C0%2C1200%2C750&w=540&h=750&q=75&fit=crop&ar=16%3A9&fm=pjpg&exp=-10"
    },
    {
      'name':"Archaeological Sites",
      'imageUrl':"https://www.visitgreece.gr/files/filippini_14-53_monuments-sounio_723x723.jpg"
    },
    {
      'name':"beach",
      'imageUrl':"https://img.freepik.com/free-psd/travel-background-composition-with-palm-tree_23-2149603156.jpg?w=1380&t=st=1667918450~exp=1667919050~hmac=b510dee8a864a9eb26468b7d31238317070dbc546f2211ba8359d3a785d87bdb"
    },
    {
      'name':"Traveling",
      'imageUrl':"https://img.freepik.com/premium-psd/suitcase-with-airplane-traveler-accessories-essential-vacation-items-adventure-travel-holida_42098-452.jpg?w=996"
    },
    {
      'name':"Archaeological Sites",
      'imageUrl':"https://www.visitgreece.gr/files/filippini_14-53_monuments-sounio_723x723.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tourism",
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Center(
                child: Text(
                  "Tourism",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(),
            ListTile(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return DefaultContainer(item: categories[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                  );
                },
                itemCount: categories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

