import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(,title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextField(cursorColor: Colors.grey,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.amber)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.amber)),
                prefixIcon: Icon(Icons.search,color: Colors.amber),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
            maxLines: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer),
      ),
    );
  }
}
