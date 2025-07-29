import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Helpers/_ToJsonFromScheduleMap.dart';
import 'package:schedule_me/Widgets/SchedualSkelton.dart';

class SchedualsHistory extends StatelessWidget {
  Function updateUi;
  String passedSubDirectory;
  SchedualsHistory({
    required this.updateUi,
    required this.passedSubDirectory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CacheDir().getCacheFiles(
        baseDirectory: this.passedSubDirectory,
        subDirectory: "/UserScheduals/",
        fileExtention: ".json",
      ),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          List<Widget> widgetList = [];

          for (var file in snapshot.data!) {
            var savedSchedual = fromJsonMap(file.readAsStringSync());
            widgetList.add(
              SchedualSkelton(
                savedSchedual,
                p.basename(file.path.split(".json")[0]),
                state: true,
                filename: p.basename(file.path),
                updateUi: updateUi,
              ),
            );
          }
          return ListView(
            children: widgetList,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
          );
        }
        return Text("Big Error");
      },
    );
  }
}
