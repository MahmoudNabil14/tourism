import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/app_router.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final Map item;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap:() {
         onTap();
      }
      ,
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
              ),
            ],
            image: DecorationImage(
                image: NetworkImage(
                    item['imageUrl']),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(35.sp)),
        child: Center(
          child: Text(
            item['name'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp,
            ),
          ),
        ),
      ),
    );
  }
}
