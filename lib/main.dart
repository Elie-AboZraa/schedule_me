import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/creating_schedules.dart';
import 'package:schedule_me/Pages/home.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( ScheduleMe());
}

class ScheduleMe extends StatelessWidget {
   const ScheduleMe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.notoKufiArabicTextTheme()),
      home: LoginPage(),
      //home: CreatingSchedulesPage(),
    );
  }
}
