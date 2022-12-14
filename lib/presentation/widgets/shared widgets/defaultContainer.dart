import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultContainer extends StatelessWidget {
  DefaultContainer(
      {Key? key,
      required this.place,
      required this.onTap,
      required this.isittrip,
      required this.index, this.iconOnPressed})
      : super(key: key);

  final Map place;
  final int index;
  final Function onTap;
  Function? iconOnPressed;
  bool isittrip = false;

  // bool IsItMyFav=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
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
                image: NetworkImage(place['imageUrl']), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(35.sp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isittrip ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (isittrip)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  icon: place['isItFav']
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  color: Colors.amber,
                  onPressed: () {
                    iconOnPressed!();
                  },
                ),
              ),
            Center(
              child: Text(
                place['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
