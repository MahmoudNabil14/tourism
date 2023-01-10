import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:tourism/presentation/screens/home_layout.dart';




class Loading extends StatelessWidget {
  const Loading({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body:AnimatedSplashScreen (splashIconSize: 350,nextScreen:  const HomeLayout(),
        splash:const Hero(tag: 'logo',
          child: Image(
            height: 800,
            image: AssetImage('images/logo.png'),
            fit: BoxFit.fill),
        ),
        duration: 1500,
        backgroundColor: const Color(0xFFFCE44D),
      ),
    );
  }
}
