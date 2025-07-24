import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Stikytopconatiner(),

              ButtonWithTextandIcon(
                text: "جدول جديد",
                icon: Icons.add,
                route: "ParsingSchedualFromFile",
                PassedData: widget.PassedData,
              ),
              ContainerBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    ButtonWithTextandIcon(
                      text: "تحديث",
                      icon: Icons.refresh,
                      function: updateUi,
                    ),
                    Text(
                      "الجداول المحفوظة",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              SchedualsHistory(
                updateUi: updateUi,
                passedSubDirectory:
                    widget.PassedData[0]["University"] +
                    "/" +
                    widget.PassedData[0]["facility"],
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateUi() {
    setState(() {});
  }
}
