import 'package:flutter/material.dart';

import '../widgets/shared widgets/defaultContainer.dart';

class CategoryPlaces extends StatelessWidget {
  const CategoryPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const DefaultContainer(
                      item: {
                        'name': '1st Trip',
                        "imageUrl":
                            'https://img.freepik.com/free-psd/travel-background-composition-with-lifeline_23-2149603160.jpg?w=1380&t=st=1667920454~exp=1667921054~hmac=d4597babcd0bbb7c327ede40f832b7345c35bde4b287e55f9f30697933f1b27b'
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    );
                  },
                  itemCount: 5),
            ),
          ],
        ),
      ),
    );
  }
}
