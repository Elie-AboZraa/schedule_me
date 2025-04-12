import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/home.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.notoKufiArabicTextTheme()),
      home: LoginPage(),
    );
  }
}
