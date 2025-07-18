import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Helpers/_ToJsonFromScheduleMap.dart';
import 'package:schedule_me/Helpers/getCacheFiles.dart';
import 'package:schedule_me/Widgets/SchedualSkelton.dart';

class SchedualsHistory extends StatelessWidget {
  Function updateUi;
  SchedualsHistory({required this.updateUi, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCacheFiles(
        subDirectory: Directory(CacheDir().directory.path + "/UserScheduals/"),
        fileExtention: ".json",
      ),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          List<Widget> widgetList = [];

          for (var file in snapshot.data!) {
            var x = fromJsonMap(file.readAsStringSync());
            widgetList.add(
              SchedualSkelton(
                x,
                p.basename(file.path.split(".json")[0]),
                state: true,
                filename: p.basename(file.path),
                updateUi: updateUi,
              ),
            );
          }
          return Expanded(child: ListView(children: widgetList));
        }
        return Text("Big Error");
      },
    );
  }
}
