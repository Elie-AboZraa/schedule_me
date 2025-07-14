import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class SchedualSkelton extends StatelessWidget {
  final int index;
  final Map<String, Map<String, Lecture>>? schedual;
  /*{Saterday:{timerange:lectureID,timerange:lectureID,timerange:lectureID},} */
  const SchedualSkelton(this.schedual, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    if (schedual == null) {
      return ContainerBox(child: Text("لا يوجد جداول ممكنة اخرى"));
    }
    return ContainerBox(
      title: " $index الجدول",
      more_option_button: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert_outlined),
      ),
      titletextstyle: Theme.of(
        context,
      ).textTheme.headlineSmall?.apply(color: Colors.black),
      //child: ScedualCalendar(),
      child: ContainerBox(child: createSchedualWidget(schedual!)),
    );
  }
}

Widget createSchedualWidget(Map<String, Map<String, Lecture>> schedual) {
  /*{Saterday:{timerange:lectureID,timerange:lectureID,timerange:lectureID},} */
  List<Widget> rowChildren = [];
  Row column = Row(
    children: [],
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  );
  for (String day in schedual.keys) {
    var timerangesMap = schedual[day]!;
    rowChildren.add(Text(day + '\n', textAlign: TextAlign.center));
    for (String timerange in timerangesMap.keys) {
      Lecture lecture = timerangesMap[timerange]!;
      rowChildren.add(
        Card(
          color: lecture.color,

          child: Padding(
            padding: const EdgeInsets.all(5.0),

            child: Text(
              '$timerange\n${lecture.repetition!} ${lecture.type!}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    if (rowChildren.isNotEmpty) {
      column.children.add(Column(children: rowChildren.toList()));
      rowChildren.clear();
    }
  }
  return column;
}
