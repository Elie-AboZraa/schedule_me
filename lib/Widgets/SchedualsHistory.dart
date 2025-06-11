import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Helpers/_ListViewFromFiles.dart';
import 'package:schedule_me/Helpers/getCacheFiles.dart';

class SchedualsHistory extends StatelessWidget {
   SchedualsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCacheFiles(subDirectory: CacheDir().directory,fileExtention: ".json"),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          return Column(
            children: ListViewFromFiles(context,snapshot.data as List<File>,"لا يوجد جداول محفوظة "),
          );
        }
        return Text("Big Error");
      },
    );
  }
}
