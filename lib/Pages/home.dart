import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/SchedualsHistory.dart';
import 'package:schedule_me/Widgets/StikyTopConatiner.dart';

class HomePage extends StatefulWidget {
    final dynamic PassedData;
  const HomePage({this.PassedData,super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Column(
        spacing:25,
        children: [
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width*0.90,
              
              child: Stikytopconatiner(clientInfo:  widget.PassedData),
            ),
          ),

          ButtonWithTextandIcon(text: "جدول جديد",icon: Icons.add,route: "ParsingSchedualFromFile",),
          SchedualsHistory(),
          
        ],
      ),
    );
  }
}