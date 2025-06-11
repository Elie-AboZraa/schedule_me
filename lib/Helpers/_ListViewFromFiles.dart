import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ScheduleFileCard.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

List<Widget> ListViewFromFiles(
  BuildContext context,
  List<File> file_list,
  String empty_message,
) {
  List<Widget> tmp_Widget_list = [];
  if (file_list.isEmpty) {
    return [ContainerBox(child: Text(empty_message))];
  } else {
    for (var file in file_list) {
      tmp_Widget_list.add(
        ScheduleFileCard(
          fileName: file.path.split('/').last,
          onTap: () => Navigator.of(
            context,
          ).push(createRoute(selection: "CreateSchedules", data: file)),
        ),
      );
    }
    return tmp_Widget_list;
  }
}
