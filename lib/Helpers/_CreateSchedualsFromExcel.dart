import 'dart:io';

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
void Set_SubjectTable_LectureTable_From_Excel(File excelfile) {
  var file =excelfile.readAsBytesSync();
  Excel excel = Excel.decodeBytes(file);
  var rows = convert(excel.tables[excel.tables.keys.first]!.rows);
  //timerange = GetTimeRange(rows);
  if (SubjectTable().Subject_list.isNotEmpty){
    SubjectTable().clear();
  }
  List<Lecture> Th_lectures=[],Lp_lectures=[];
  for (var row in rows) {
    if (row[0]=="Sub") {
      SubjectTable().Subject_list.add(Subject(name: row[1], hours: row[2], type: (row[3]==null)?"غير محدد":row[3], Th_lectures: Th_lectures, Lp_lectures: Lp_lectures));
      Th_lectures.clear();
      Lp_lectures.clear();
    }else{
      if(row[1]=='T'){
      Th_lectures.add(Lecture(subject: row[0], lecture_repetition: row[1], day: row[2], academicTime: row[3], classroom: row[4], teacher: row[5]));
      }else if(row[1]=='P'){
        Lp_lectures.add(Lecture(subject: row[0], lecture_repetition: row[1], day: row[2], academicTime: row[3], classroom: row[4], teacher: row[5]));
      }else{
        FlutterError("Somthing Worng with Excel Data Order");
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
