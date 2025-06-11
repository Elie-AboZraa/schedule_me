import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/SchedualsHistory.dart';
import 'package:schedule_me/Widgets/StikyTopConatiner.dart';

class HomePage extends StatefulWidget {
  final dynamic PassedData;
  const HomePage({this.PassedData, super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CacheDir().init(
      widget.PassedData[0]["University"] +
          "/" +
          widget.PassedData[0]["facility"],
    );
    return Scaffold(
      body: Column(
        spacing: 25,
        children: [
          Center(
            child: Container(
              alignment: Alignment.topCenter,

              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width * 0.90,

              child: Stikytopconatiner(),
            ),
          ),

          ButtonWithTextandIcon(
            text: "جدول جديد",
            icon: Icons.add,
            route: "ParsingSchedualFromFile",
            PassedData: widget.PassedData,
          ),
          FutureBuilder(
            future: CacheDir().init(
              "UserSchedules/"+
              widget.PassedData[0]["University"] +
                  "/" +
                  widget.PassedData[0]["facility"],
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return SchedualsHistory();
            },
          ),
        ],
      ),
    );
  }
}
