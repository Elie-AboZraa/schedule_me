import 'package:flutter/material.dart';
import 'package:schedule_me/Class/TimeOfLecture.dart';

class ScedualCalendar extends StatelessWidget {
  const ScedualCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, TimeOfLecture> Calender = {};
    for (var i = 0; i < 10; i++) {
      Calender.addAll({
        'as': TimeOfLecture(Start: "", End: ""),
        'a2': TimeOfLecture(Start: "", End: ""),
      });
    }
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_ScedualEntity()],
        ),
        Row(children: []),
      ],
    );
  }
}
/*
List<Widget> temp(Map<Day, TimeOfLecture> calendar) {
  List<Widget> temp = [];
  temp.add(Text("list"));
  for (var x in calendar.keys) {
    for (var y in x) 
      temp.add(_ScedualEntity());
  }
  return temp;
}
***/
class _ScedualEntity extends StatelessWidget {
  const _ScedualEntity({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
