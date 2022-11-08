import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/presentation/widgets/shared%20widgets/MyDrawer.dart';

import '../router/app_router.dart';
import '../widgets/shared widgets/defaultContainer.dart';

class CategoryPlaces extends StatelessWidget {
  const CategoryPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  DefaultContainer(
                      item: {
                        'name': '1st Trip',
                        "imageUrl":
                            'https://img.freepik.com/free-psd/travel-background-'
                                'composition-with-lifeline_23-214960316'
                                '0.jpg?w=1380&t=st=1667920454~exp=1667921054~hmac='
                                'd4597babcd0bbb7c327ede40f832b7345c35bde4b287e55f9f30697933f1b27b'
                      },
                   onTap: (){
                     Navigator.pushNamed(context, Routes.place,);
                   }, );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 25.h,
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
