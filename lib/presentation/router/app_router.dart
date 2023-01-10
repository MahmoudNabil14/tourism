import 'package:flutter/material.dart';
import 'package:tourism/presentation/screens/About_us_screen.dart';
import 'package:tourism/presentation/screens/loading_screen.dart';
import 'package:tourism/presentation/screens/request_screen.dart';
import 'package:tourism/presentation/screens/search_screen.dart';
import 'package:tourism/presentation/screens/terms_and_condions_screen.dart';
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
  static const String aboutUs = '/Aboutus';
  static const String terms = '/Terms';
  static const String request = '/Request';
  static const String search = '/Search';
}

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    Map<String, dynamic>? routeArguments;
    if (routeSettings.arguments != null) {
      routeArguments = routeSettings.arguments as Map<String, dynamic>;
    }
    switch (routeSettings.name) {
      case (Routes.initialRoute):
        return MaterialPageRoute(builder: (context) => const Loading());
      case (Routes.categoryPlaces):
        return MaterialPageRoute(
            builder: (context) => CategoryPlaces(
                categoryID: routeArguments!['categoryId'],
                name: routeArguments['name']));
      case (Routes.place):
        return MaterialPageRoute(
            builder: (context) => Place(
                placeId: routeArguments!['placeId'],
                name: routeArguments['name'],
                description: routeArguments['description'],
                imageUrl: routeArguments['imageUrl'],
            images: routeArguments['images'],
            offers: routeArguments['offers'],));
      case (Routes.payerDetails):
        return MaterialPageRoute(builder: (context) =>  PayerDetails(myoffer: routeArguments!['myoffer'],tripName: routeArguments['tripName'],));
      case (Routes.homeLayout):
        return MaterialPageRoute(builder: (context) => const HomeLayout());
      case (Routes.aboutUs):
        return MaterialPageRoute(builder: (context) => const Aboutus());
      case (Routes.terms):
        return MaterialPageRoute(builder: (context) => const Terms());
      case (Routes.request):
        return MaterialPageRoute(builder: (context) =>  Request(tripname: routeArguments!['tripname'], name: routeArguments['name'],));
        case (Routes.search):
        return MaterialPageRoute(builder: (context) =>   const SearchScreen());
      default:
        return null;
    }
  }
}
