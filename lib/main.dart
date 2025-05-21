import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/home.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_me/Pages/test-connection.dart';

void main() {
  runApp( ScheduleMe());
}

class ScheduleMe extends StatelessWidget {
   const ScheduleMe({super.key});

  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.notoKufiArabicTextTheme(),colorSchemeSeed: Colors.white),
      //home: Test_connectionState(),
      home: LoginPage(),
      //home: CreatingSchedulesPage(),
    );
  }
}
