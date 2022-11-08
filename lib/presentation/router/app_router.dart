import 'package:flutter/material.dart';
import '../screens/category_places.dart';
import '../screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String categoryPlaces = '/categoryPlaces';
}

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.initialRoute):
        return MaterialPageRoute(builder: (context) => HomeScreen());
        case (Routes.categoryPlaces):
        return MaterialPageRoute(builder: (context) => const CategoryPlaces());
      default:
        return null;
    }
  }
}
