import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  About Us ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Text(
                style: TextStyle(fontSize: 15.sp),
                ' Tourism App is your to chill in egypt ,'
                'discover new places and enjoy the fabulous vibes ,visit all ancient places. '),
          ),
        ],
      ),
    );
  }
}
