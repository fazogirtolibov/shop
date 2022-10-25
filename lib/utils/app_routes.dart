import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1_exam/screens/bottom_navigation.dart';
import 'package:flutter_1_exam/screens/home_page.dart';
import 'package:flutter_1_exam/screens/signin_page.dart';
import 'package:flutter_1_exam/screens/signup_page.dart';
import 'package:flutter_1_exam/screens/splash_page.dart';

abstract class RouteName {
  static const main = '/';
  static const home = '/home';
  static const splash = '/splash';
  static const signin = '/signin';
  static const signup = '/signup';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.main:
        return MaterialPageRoute(builder: (_) => BottomNavigation());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.signin:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            clothes: [],
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
