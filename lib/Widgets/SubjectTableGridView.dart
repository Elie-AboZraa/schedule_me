import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/SubjectTable.dart';
import 'package:schedule_me/Helpers/_CreateSchedualsFromExcel.dart';
import 'package:schedule_me/Widgets/Container&Title&Subtitle&Button.dart';
import 'package:schedule_me/Widgets/CoustomeGridView.dart';

class SubjectTableGridView extends StatelessWidget {
  final List chosenScheduals;
  final List fetchedSubjects;
  const SubjectTableGridView({required this.fetchedSubjects,required  this.chosenScheduals,super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    //To-DO chek if the file is excel in content and are able to be read
    if (fetchedSubjects[0] is File ) {
      Set_SubjectTable_LectureTable_From_Excel(fetchedSubjects[0]);
      for (var subject in SubjectTable().Subject_list) {
        widgetList.add(
          ContainerTitleSubtitleButton(
            SubjectObject: subject,
            passedList: chosenScheduals,
          ),
        );
      }
      
    }else{
      return Text("erooorrr");
    }
    var crossAxisCount = (MediaQuery.of(context).size.width / 400).round();
    return CustomGridView(
      crossAxisCount: crossAxisCount,
      children: widgetList,
    );
  }
}