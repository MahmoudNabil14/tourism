import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Welcome To Your Tourism App!',
        style: TextStyle(fontSize: 23),
      ),
      ),
      body: Column(children: [
        SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('About Us'),
              leading: Icon(Icons.info),
              trailing: Icon(Icons.arrow_forward_ios),
              style: ListTileStyle.list,
            )),
        SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Terms and Conditions'),
              leading: Icon(Icons.policy),
              trailing: Icon(Icons.arrow_forward_ios),
              style: ListTileStyle.list,
            )),
        SizedBox(
          height: 15.h,
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
          height: 15.h,
        ),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Become a Partner'),
              leading: Icon(Icons.join_full),
              trailing: Icon(Icons.arrow_forward_ios),
              style: ListTileStyle.list,
            ),
        ),SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text('Invite Your Friends'),
              leading: Icon(Icons.group_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
              style: ListTileStyle.list,
            )),
      ]),
    );
  }
}
