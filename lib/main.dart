import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScheduleMe());
}

class ScheduleMe extends StatelessWidget {
  const ScheduleMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.notoKufiArabicTextTheme(),
        colorSchemeSeed: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
