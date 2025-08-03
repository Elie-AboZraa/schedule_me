import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ScheduleFileCard.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

List<Widget> ListViewFromFiles(
  BuildContext context,
  List<File> file_list,
  String empty_message,
  Function updateui,
) {
  List<Widget> tmp_Widget_list = [];
  if (file_list.isEmpty) {
    return [ContainerBox(child: Text(empty_message))];
  } else {
    for (var file in file_list) {
      tmp_Widget_list.add(
        Row(
          children: [
            Expanded(
              child: ScheduleFileCard(
                fileName: file.path.split('/').last,
                onTap: () => Navigator.of(
                  context,
                ).push(createRoute(selection: "CreateSchedules", data: file)),
              ),
            ),
            IconButton(
              onPressed: () {
                file.deleteSync();
                updateui();
              },
              icon: Icon(Icons.delete, color: Colors.red),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 189, 189),
              ),
            ),
          ],
        ),
      );
    }
    return tmp_Widget_list;
  }
}
