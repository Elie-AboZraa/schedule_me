import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_me/pdf_parser.dart';

void main() {
  //runApp( ScheduleMe());
  WidgetsFlutterBinding.ensureInitialized();
  test('Parses lectures correctly', () async {
    final Schedule schedule = await PdfParser.parsePdfContent("schedual.pdf");

    // Verify the first lecture
    expect(schedule.lectures.first, isA<Lecture>()); // Uses YOUR Lecture class
    print(schedule.lectures.first);
    File("the_output_of_The_FUCKING_PARSING.json").writeAsString( jsonEncode(schedule.toJson()));
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
