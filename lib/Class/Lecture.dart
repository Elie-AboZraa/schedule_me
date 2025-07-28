import 'package:flutter/material.dart';

class Lecture {
  // TO-Do change the subject atribute to subject_name
  final int subjectId;
  final String? subject;
  final String? teacher;
  final List<String>? timeRange;
  //lecture_repetition= الشعبة
  final String? repetition;
  final String? classroom;
  final String? type;
  final String? day;
  Color? color;
  Lecture({
    required this.subjectId,
    required this.subject,
    required this.repetition,
    required this.day,
    required this.timeRange,
    required this.classroom,
    required this.teacher,
    required this.type,
    this.color,
  });

  @override
  String toString() {
    return 'Lecture: $subject,$classroom,$day,$timeRange,$teacher';
  }

  Lecture copy() {
    return new Lecture(
      subjectId: subjectId,
      subject: subject,
      repetition: repetition,
      day: day,
      timeRange: timeRange,
      classroom: classroom,
      teacher: teacher,
      type: type,
      color: this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectId": subjectId,
      "subject": subject,
      "repetition": repetition,
      "day": day,
      "timeRange": timeRange,
      "classroom": classroom,
      "teacher": teacher,
      "type": type,
      "color": this.color!.toARGB32(),
    };
  }

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      subjectId: json["subjectId"],
      subject: json["subject"],
      repetition: json["repetition"],
      day: json["day"],
      timeRange: json["timeRange"].cast<String>(),
      classroom: json["classroom"],
      teacher: json["teacher"],
      type: json["type"],
      color: Color(json["color"]),
    );
  }
}
