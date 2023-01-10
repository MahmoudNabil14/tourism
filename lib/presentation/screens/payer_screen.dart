import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/presentation/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

class PayerDetails extends StatelessWidget {
   PayerDetails({Key? key, required this.myoffer, required this.tripName})
      : super(key: key);
  final Map<dynamic, dynamic> myoffer;
  final String tripName;
  // Define the URL to open
  var url = 'https://www.google.com/maps?q=';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tripName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                myoffer['name'],
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(myoffer['image']),
            const SizedBox(
              height: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: SizedBox(
              height: 75.h,
              child: Card(
                color: Colors.grey[100],
                elevation: 3,
                child: Row(
                  children: [
                    const Icon(Icons.place, size: 25),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(onTap: () {
                      final Uri mapurl =
                      Uri.parse('https://www.google.com/maps?q=${myoffer['address']}');
                      launchUrl(mapurl,mode: LaunchMode.externalApplication);
                    },
                      child: Text(
                        myoffer['address'],overflow: TextOverflow.fade,
                        style:  TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )),
             SizedBox(
              height: 10.h,
            ),
            Center(
                child: SizedBox(
              height: 75.h,
              child: Card(
                color: Colors.grey[100],
                elevation: 3,
                child: Row(
                  children: [
                    const Icon(Icons.phone_android_outlined, size: 25),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        final Uri phoneLaunchUri = Uri(
                          scheme: 'tel',
                          path: myoffer['phone'],
                        );
                        launchUrl(phoneLaunchUri);
                      },
                      child: Text(
                        myoffer['phone'],
                        style:
                             TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: SizedBox(
              height: 75.h,
              child: Card(
                color: Colors.grey[100],
                elevation: 3,
                child: Row(
                  children: [
                    const Icon(Icons.ac_unit_outlined, size: 25),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        final Uri url =
                            Uri.parse('https://${myoffer['website']}');
                        launchUrl(url,
                            webViewConfiguration: const WebViewConfiguration(
                                enableJavaScript: true),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        myoffer['website'],
                        style:
                             TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.request, arguments: {
                    'name': myoffer['name'],
                    'tripname': tripName,
                  });
                },
                color: Colors.amber,
                child: Text(
                  'Request',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
