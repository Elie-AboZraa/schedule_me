import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/Subject.dart';

import 'package:schedule_me/Class/SubjectTable.dart';

List<String> validDays = [
  'monday',
  'teusday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];
void Set_SubjectTable_LectureTable_From_CSV(File csvfile) {
  //TO-DO Check gor if the provided file is Directory

  var rows = CsvToListConverter(
    shouldParseNumbers: false,
  ).convert(csvfile.readAsStringSync());
  //timerange = GetTimeRange(rows);
  if (SubjectTable().Subject_list.isNotEmpty) {
    SubjectTable().clear();
  }
  List<Lecture> Th_lectures = [], Lp_lectures = [];
  var counter = 0;
  for (var row in rows) {
    if (row[0] == "Sub") {
      SubjectTable().Subject_list.add(
        Subject(
          index: counter,
          name: row[1],
          hours: row[2],
          type: (row.length > 3) ? row[3] : "غير محدد",
          Th_lectures: Th_lectures.toList(),
          Lp_lectures: Lp_lectures.toList(),
        ),
      );
      Th_lectures.clear();
      Lp_lectures.clear();
      counter++;
    } else {
      if (row[7] == 'T') {
        Th_lectures.add(
          Lecture(
            subjectId: counter,
            subject: row[1],
            repetition: row[2],
            day: row[3],
            timeRange: row[4]
                .toString()
                .substring(1, row[4].toString().length - 1)
                .split(','),
            classroom: row[5],
            teacher: row[6],
            type: 'T',
          ),
        );
      } else if (row[7] == 'P') {
        Lp_lectures.add(
          Lecture(
            subjectId: counter,
            subject: row[1],
            repetition: row[2],
            day: row[3],
            timeRange: row[4]
                .toString()
                .substring(1, row[4].toString().length - 1)
                .split(','),
            classroom: row[5],
            teacher: row[6],
            type: 'P',
          ),
        );
      } else {
        FlutterError("Somthing Worng with Csv Data Order");
      }
    }
  }
}

//clean the name of subject and return the number of the lecture number (الشعبة)

List<List<String?>> convert(List<List<Data?>> input) {
  return input.map((innerList) {
    return innerList.map((data) {
      if (data == null) {
        return null; // Keep null as null
      }
      return data.value.toString(); // Convert Data to String
    }).toList();
  }).toList();
}
