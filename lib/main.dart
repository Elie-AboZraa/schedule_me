import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/home.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_me/Pages/test-connection.dart';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_me/pdf_parser.dart';
import 'package:schedule_me/class/Lecture.dart'; 

void main() {
  runApp( ScheduleMe());
  test('Parses lectures correctly', () async {
    final file = File('test/schedule.txt');
    final lines = await file.readAsLines();
    final schedule = parsePdfContent(lines);

    // Verify the first lecture
    expect(schedule.lectures.first, isA<Lecture>()); // Uses YOUR Lecture class
    print(schedule.lectures.first);
  });
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
