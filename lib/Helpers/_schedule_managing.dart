import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';

bool fetch_scheduls() {
  return false;
}

dynamic schedule_managing(context) {
  if (fetch_scheduls()) {
    return Container();
  } else {
    return ButtonWithTextandIcon(text: "جدول جديد",icon: Icons.add,route: "CreateSchedules",);
  }
}
