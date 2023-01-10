import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/presentation/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';


class MoreScreen extends StatelessWidget {
   MoreScreen({Key? key}) : super(key: key);
final Uri url=Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSdrYOACHio_3Ofy'
    '6vL1Zq2prHKXNZvY2dMoJfeDRoNF7lEHOw/viewform?usp=sf_link');
   final Uri emailLaunchUri = Uri(
     scheme: 'mailto',
     path: 'hossammuhammed79@yahoo.com',

   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Welcome To Your Tourism App!',
        style: TextStyle(fontSize: 23),
      ),
      ),
      body: Column(children: [
        SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.Aboutus);
            },
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
            onTap: () {
              Navigator.pushNamed(context, Routes.terms);
            },
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
            onTap: () {
             launchUrl(emailLaunchUri) ;
            },
            child: const ListTile(
              title: Text('Send Us a Message'),
              leading: Icon(Icons.send_rounded),
              trailing: Icon(Icons.arrow_forward_ios),
              style: ListTileStyle.list,
            )),
        SizedBox(
          height: 15.h,
        ),
        InkWell(
            onTap: () {
              launchUrl(url);
            },
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
