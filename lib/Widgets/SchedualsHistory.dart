import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_ListViewFromFiles.dart';
import 'package:schedule_me/Helpers/getCacheFiles.dart';

class SchedualsHistory extends StatelessWidget {
  const SchedualsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCacheFiles(subDirectory: "/UserSchedules"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          return Column(
            children: ListViewFromFiles(snapshot.data as List<File>,"لا يوجد جداول محفوظة "),
          );
        }
        return Text("ss");
      },
    );
  }
}
