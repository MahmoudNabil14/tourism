import 'package:flutter/material.dart';
import 'package:tourism/presentation/router/app_router.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_outlined),
            Text(
              'No Favourites yet',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),SizedBox(height: 25,),
            ElevatedButton(clipBehavior: Clip.hardEdge,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.homeLayout);
              },
              child: Container(width: 250,height: 40,
                child: Center(
                  child: Text(
                    'Add To Favourite',
                  ),
                ),
              ),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amberAccent),
                elevation: MaterialStatePropertyAll(20),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
