import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_me/Widgets/TextFieldContainer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.aDLaMDisplayTextTheme()),
      home: Scaffold(
        body: Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 100),
                child: Text("جدولني",style: Theme.of(context).textTheme.displayLarge,)),
              TextFieldContainer(),
              TextFieldContainer(type: "password",),
              
            ],
          ),
        ),
      ),
    );
  }
}
