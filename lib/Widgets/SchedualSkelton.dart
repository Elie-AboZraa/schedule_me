import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Helpers/_ToJsonFromScheduleMap.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class SchedualSkelton extends StatelessWidget {
  final String title;
  final Map<String, Map<String, Lecture>>? schedual;
  final bool? state;
  String? filename;
  Function? updateUi;

  /*{Saterday:{timerange:lectureID,timerange:lectureID,timerange:lectureID},} */
  SchedualSkelton(
    this.schedual,
    this.title, {
    this.state,
    this.filename,
    this.updateUi,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (schedual == null) {
      return ContainerBox(child: Text("لا يوجد جداول ممكنة اخرى"));
    }
    return ContainerBox(
      title: title,
      more_option_button: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert_outlined),
      ),
      saveFunction: _saveSchedual,
      savestate: state,
      titletextstyle: Theme.of(
        context,
      ).textTheme.headlineSmall?.apply(color: Colors.black),
      child: ContainerBox(child: createSchedualWidget(schedual!, context)),
    );
  }

  _saveSchedual(bool state) {
    filename ??= "${DateTime.now()}.json";
    if (state) {
      CacheDir().saveScheduleAsJson(
        jsonEncode(toJsonMap(schedual!)),
        filename!,
      );
    } else {
      CacheDir().DeleteJsonSchedule(filename!);
    }
    if (updateUi != null) {
      updateUi!();
    }
  }
}

Widget createSchedualWidget(
  Map<String, Map<String, Lecture>> schedual,
  context,
) {
  /*{Saterday:{timerange:lectureID,timerange:lectureID,timerange:lectureID},} */
  List<Widget> rowChildren = [];
  Row column = Row(
    children: [],
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  );
  for (String day in schedual.keys) {
    var timerangesMap = schedual[day]!;
    rowChildren.add(
      Card(
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(day, textAlign: TextAlign.center),
        ),
      ),
    );
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
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * 1.5,
    child: SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: column,
    ),
  );
}
