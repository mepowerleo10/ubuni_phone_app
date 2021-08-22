/* -- routes.dart
  Contains all routes for the application screens, and navigations
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/routes/introductory_page.dart';
// import 'package:ubuni_phone_app/routes/home_page.dart';
import 'package:ubuni_phone_app/routes/new_home_page.dart';
import 'package:ubuni_phone_app/routes/list_page.dart';
import 'package:ubuni_phone_app/routes/item_page.dart';

class RouteGenerator {
  static const String homePage = "/";
  static const String listPage = "/list"; // Phones list page
  static const String itemPage = "/item"; // Individual phone page
  static const String introPage = "/intro";

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case listPage:
        return MaterialPageRoute(
            builder: (_) => const ListPage(), settings: settings);
      case itemPage:
        return MaterialPageRoute(
            builder: (_) => ItemPage(), settings: settings);
      case introPage:
        return MaterialPageRoute(builder: (_) => IntroPage());
      default:
        throw FormatException("Route Not Found!");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
