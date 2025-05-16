import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

List<Widget> ListViewFromFiles(List<File> file_list, String empty_message) {
  if (file_list.isEmpty) {
    return [ContainerBox(child: Text(empty_message))];
  } else {
    return [ContainerBox(child: Text("Error"))];
  }

}
