import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/SubjectTable.dart';
import 'package:schedule_me/Helpers/_CreateSchedualsFromExcel.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/Container&Title&Subtitle&Button.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/FilterContainer.dart';
import 'package:schedule_me/Widgets/CoustomeGridView.dart';
import 'package:schedule_me/Widgets/SubjectTableGridView.dart';

class CreatingSchedulesPage extends StatefulWidget {
  final dynamic fetchedSchedules;

  const CreatingSchedulesPage({this.fetchedSchedules, super.key});
  @override
  State<CreatingSchedulesPage> createState() => _CreatingSchedulesPageState();
}

var x = 0;

class _CreatingSchedulesPageState extends State<CreatingSchedulesPage> {
  void _onStateChanged() {
    setState(() {
      x++;
    });
  }

  var icon = Icons.heart_broken;

  

  @override
  Widget build(BuildContext context) {
    /*if (widget.fetchedSchedules==null){
    CreateSchedualsFromExcel(widget.fetchedSchedules!,);
    }else{
      const Duration(seconds: 2);
          CreateSchedualsFromExcel(widget.fetchedSchedules!,);

    }*/
    var chosenScheduals=[];
    return Scaffold(
      appBar: AppBar(
        title: Text("جدول جديدة"),
        elevation: 2,
        surfaceTintColor: Colors.grey,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Column(
            children: [
              ContainerBox(
                title: "فلاتر",
                // child: Container(),
                child: FilterContainer(onStateChanged: _onStateChanged),
              ),
              ContainerBox(
                title: "اختر المواد التي تريد دراستها",
                child: SubjectTableGridView(fetchedSubjects: [widget.fetchedSchedules],chosenScheduals: chosenScheduals),
                
              ),
              ContainerBox(
                child: ButtonWithTextandIcon(
                  text: "جدول",
                  function: () => Navigator.of(
                    context,
                  ).push(createRoute(selection: "ChooseSchedule")),
                  textstyle: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.apply(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
