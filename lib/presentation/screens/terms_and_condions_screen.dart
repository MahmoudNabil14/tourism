import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 3,
        title: const Text(
          '  Terms and Condtions ',
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
                style: TextStyle(fontSize: 16.sp),
                'By downloading or using the app, these terms will'
               ' automatically apply to you - you should make sure'
           'therefore that you read them carefully before using the'
           ' app. You\'re not allowed to copy or modify the app, any'
               ' part of the app, or our trademarks in any way. You\'re not'
           ' allowed to attempt to extract the source code of the app,'
                ' and you also shouldn\'t try to translate the app into other'
            '  languages or make derivative versions. The app itself,'
            '  and all the trademarks, copyright, database rights, and'
            '  other intellectual property rights related to it, still belong'
            '   to Rev Technologies LLC.'
            '   Rev Technologies LLC is committed to ensuring that the'
            ' app is as useful and efficient as possible. For that'
            '   reason, we reserve the right to make changes to the app'
            '   or to charge for its services, at any time and for any'
            ' reason. We will never charge you for the app or its'
            ' services without making it very clear to you exactly what'
            '  you\'re paying for.'
            ' The app does use third-party services that declare their'
            ' Terms and Conditions.'
            ' Link to Terms and Conditions of third-party service'
                'providers used by the app'
                '  * Google Play Services'
                ' You should be aware that there are certain things that'
                ' Rev Technologies LLC will not take responsibility for.'
                ' Certain functions of the app will require the app to have'
                ' an active internet connection. The connection can be Wi-'
                ' Fi or provided by your mobile network provider, but Rev'
                '     Technologies LLC cannot take responsibility for the app'
                '  not working at full functionality if you don\'t have access'
            ' to Wi-Fi, and you don\'t have any of your data allowance'
            ' left.'
            // ' If you\'re using the app outside of an area with Wi-Fi, you'
            //     ' should remember that the terms of the agreement with'
            // ' your mobile network provider will still apply. As a result,'
            // '   you may be charged by your mobile provider for the cost'
            // '  of data for the duration of the connection while'
            // '  accessing the app, or other third-party charges. In using'
            // '   the app, you\'re accepting responsibility for any such'
            // ' charges, including roaming data charges if you use the'
            //     ' app outside of your home territory (i.e. region or country)'
              //  '  without turning off data roaming.'
            ),
          ),
        ],
      ),
    );
  }
}
