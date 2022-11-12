import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayerDetails extends StatelessWidget {
  const PayerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.all(15),
              width: double.infinity,

              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontSize: 22, color: Colors.amber),
                        ),
                        TextSpan(
                          text: 'Dahab Travel',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Adress: ',
                          style: TextStyle(fontSize: 22, color: Colors.amber),
                        ),
                        TextSpan(
                          text: '243 a7a ST , Monofya',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Phone: ',
                          style: TextStyle(fontSize: 22, color: Colors.amber),
                        ),
                        TextSpan(
                          text: '01000000000',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Text(
                ' Blue Hole',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•We will get there 10 am ',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Text('•Our jurreny begins 7 am',style: TextStyle(fontSize: 20),),
            Spacer(),
            Container(width: double.infinity,height: 50,
              child: MaterialButton(onPressed: (){

              },color: Colors.amber,child: Text('Request'),),
            )


            ],
        ),
      ),
    );
  }
}
