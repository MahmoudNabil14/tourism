import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.amberAccent),
            child: Center(
              child: Text(
                "Tourism",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Account'),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_forward_ios),
                style: ListTileStyle.list,
              )),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('My Trips'),
                leading: Icon(Icons.card_travel),
                trailing: Icon(Icons.arrow_forward_ios),
                style: ListTileStyle.list,
              )),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Language'),
                leading: Icon(Icons.language_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                style: ListTileStyle.list,
              )),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.info_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                style: ListTileStyle.list,
              )),
        ],
      ),
    );
  }
}
