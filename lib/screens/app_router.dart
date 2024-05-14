// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mor_flutter_project/screens/barrel_screens.dart';

class AppRouter {
  static const String INTRODUCTION_SCREEN = 'instroduction_screen';
  static const String DASHBOARD_SCREEN = 'dashboard_screen';
  static const String LOGIN_SCREEN = 'login_screen';
  static const String HOME_SCREEN = 'home_screen';

  // Generate Router
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case INTRODUCTION_SCREEN:
        return MaterialPageRoute(builder: (_) => IntroductionScreen());
      case DASHBOARD_SCREEN:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => DashboardScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
