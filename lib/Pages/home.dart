import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/StikyInfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          
          padding: EdgeInsets.only(top: 16),
          width: MediaQuery.of(context).size.width*0.90,
          
          child: StikyInfo(),
        ),
      ),
    );
  }
}