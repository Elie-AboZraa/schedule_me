// the point of this class is to difrintuate betwean the LectureTable which is the scheduals that is going to be extracted from the excel file
// and the Subject that are available to choose from
// for example : there is two lecture with the same name but are difrent in time and teacher
// the LectureTable will allow that
// the Subject will Not , it will count it as one subject , with two difrent lectures
import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Lecture.dart';

class Subject {
  final int? index;
  final String? name;
  final String? hours;
  final String? type;
  final List<Lecture> Th_lectures;
  final List<Lecture> Lp_lectures;
  Color? color;

  Subject({
    required this.index,
    required this.name,
    required this.hours,
    required this.type,
    required this.Th_lectures,
    required this.Lp_lectures,
  });

  @override
  String toString() {
    //to make debugging easier
    return '$name';
  }
}
