import 'package:flutter/material.dart';

class Lecture {
  // TO-Do change the subject atribute to subject_name
  final int subjectId;
  final String? subject;
  final String? teacher;
  final String? academicTimeStart;
  final String? academicTimeEnd;
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
    required this.academicTimeStart,
    required this.academicTimeEnd,
    required this.classroom,
    required this.teacher,
    required this.type,
    this.color,
  });

  @override
  String toString() {
    return 'Lecture: $subject,$classroom,$day,$academicTimeStart,$academicTimeEnd,$teacher';
  }

  Lecture copy() {
    return new Lecture(
      subjectId: subjectId,
      subject: subject,
      repetition: repetition,
      day: day,
      academicTimeStart: academicTimeStart,
      academicTimeEnd: academicTimeEnd,
      classroom: classroom,
      teacher: teacher,
      type: type,
      color: this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'academicTimeStart': academicTimeStart.toString(),
      'academicTimeEnd': academicTimeEnd.toString(),
      'teacher': teacher.toString(),
      'classroom': classroom.toString(),
      'day': day.toString(),
      'type': type,
    };
  }
}
