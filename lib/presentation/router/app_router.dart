import 'package:flutter/material.dart';
import 'package:tourism/presentation/screens/loading_screen.dart';
import '../screens/category_places.dart';
import '../screens/home_layout.dart';
import '../screens/payer_screen.dart';
import '../screens/place.dart';

class Routes {
  static const String initialRoute = '/';
  static const String categoryPlaces = '/categoryPlaces';
  static const String place = '/place';
  static const String payerDetails = '/PayerDetails';
  static const String homeLayout = '/HomeLayout';
}

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.initialRoute):
        return MaterialPageRoute(builder: (context) => const Loading());
        case (Routes.categoryPlaces):
        return MaterialPageRoute(builder: (context) => const CategoryPlaces());
      case (Routes.place):
        return MaterialPageRoute(builder: (context) => const Place());
      case (Routes.payerDetails):
        return MaterialPageRoute(builder: (context) => const PayerDetails());
      case (Routes.homeLayout):
        return MaterialPageRoute(builder: (context) =>  const HomeLayout());
      default:
        return null;
    }
  }
}
