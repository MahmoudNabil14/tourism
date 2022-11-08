import 'package:flutter/material.dart';
import '../screens/category_places.dart';
import '../screens/home_screen.dart';
import '../screens/place.dart';

class Routes {
  static const String initialRoute = '/';
  static const String categoryPlaces = '/categoryPlaces';
  static const String place = '/place';
}

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.initialRoute):
        return MaterialPageRoute(builder: (context) => HomeScreen());
        case (Routes.categoryPlaces):
        return MaterialPageRoute(builder: (context) => const CategoryPlaces());
      case (Routes.place):
        return MaterialPageRoute(builder: (context) => const Place());
      default:
        return null;
    }
  }
}
