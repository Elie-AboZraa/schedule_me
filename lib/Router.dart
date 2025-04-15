import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/home.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:schedule_me/Pages/creating_schedules.dart';

dynamic createRoute(String selection) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (selection) {
        case "Login":
          return LoginPage();
        case "Home":
          return HomePage();
        case "CreateSchedules":
          return CreatingSchedulesPage();
        default:
          return LoginPage();
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
