import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism/presentation/widgets/place_widgets/payer.dart';

import '../widgets/shared widgets/MyDrawer.dart';

class Place extends StatefulWidget {
  const Place({Key? key}) : super(key: key);

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  String bigPhoto =
      'https://www.luxorandaswan.com/photos/old/2019/07/Alexandria-Library-Egypt-2.jpg';
  List<Map> places = [
    {
      'name': 'boy',
      'image':
          'https://img.freepik.com/free-photo/young-student-learning-library_23-2149215399.'
              'jpg?w=1380&t=st=1667928473~exp=1667929073~hmac=fa5ecbde0f025ec68c9f6a6413e672475f026953b26a89b55a9051754e660dbf'
    },
    {
      'name': 'girl',
      'image':
          'https://english.ahram.org.eg/Media/News/2014/3/13/2014-635303409753159476-315.jpg'
    },
    {
      'name': 'mahmoud',
      'image':
          'https://img.freepik.com/premium-photo/student-picking-book-from-shelf-library_13339-106557.jpg?w=1380'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('place'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(bigPhoto),
              height: MediaQuery.of(context).size.height / 3.5,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              height: 100,
              width: double.infinity,
              child: Center(
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            bigPhoto = places[index]['image'].toString();
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(places[index]['image']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.w,
                      );
                    },
                    itemCount: 3),
              ),
            ),
            Center(
              child: Text(
                ' Description',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                'The Great Library of Alexandria in Alexandria, Egypt, was one of the largest and most significant libraries of the ancient world.'
                ' The Library was part of a larger research institution called the Mouseion, which was dedicated to the Muses, the nine goddesses of the arts.[10] The idea of a universal library'
                ' in Alexandria may have been proposed by Demetrius of Phalerum, an exiled Athenian statesman living in Alexandria, to Ptolemy I Soter, who may have established plans for the Library,'
                ' but the Library itself was probably not built until the reign of his son Ptolemy II Philadelphus. The Library quickly acquired many papyrus scrolls, owing largely to the Ptolemaic '
                'kings\' aggressive and well-funded policies for procuring texts.',
                style: TextStyle(fontSize: 20),
              ),
            ),

            Center(
              child: Text(
                ' Offered By',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Payer();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
