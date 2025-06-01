import 'dart:io';
import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/TimeRange.dart';
import 'package:schedule_me/Class/Timetable.dart';

List<String> validDays = [
  'monday',
  'teusday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];
void CreateSchedualsFromExcel(File excelfile) {
  var excel = Excel.decodeBytes(excelfile.readAsBytesSync());
  var calendar = Timetable();
  //Lecture(subject: subject, day: day, location: location, time: TimeRange(_start, _end))
  var day = "saturday";
  List<TimeRange> timerange = [];
  int count = 1;
  var rows = convert(excel.tables[excel.tables.keys.first]!.rows);
  timerange = GetTimeRange(rows);

  for (var row in rows) {
    // check if its a location , if it is, then check behinde it for a day
    // other than that check the hole list of strings for the day
    int? index = islocation(row);
    var tmp = isDay(row, index);
    if (tmp != null) {
      day = tmp;
    }
    if (index != null) {
      calendar.addAllLecture( CreateLectures(row.sublist(index+1) ,day,row[index],timerange[count]));
      calendar;
    }
  }
  
 //calendar.addAllLecture();
}

CreateLectures(List<String?> row, day, location, timerange) {
   List<Lecture> Lecture_list=[];
   for (var subject in row){
    if(subject!=null)
        {Lecture_list.add(Lecture(subject: subject, day: day, classroom: location, academicTime: timerange,teacher: ""));
   }}
   if (Lecture_list.isNotEmpty) {
     return Lecture_list;
   }else{
    print("eeeehe error");
    FlutterError("Somthing wrong with reading the file ");
   }
  //print(day);
  //print(location);
  //print(timerange); 

}

islocation(row) {
  for (int i = 0; i < row.length; i++) {
    if (row[i] == "Period") return null;
    if (row[i] != null) {
      if (RegExp(r'^(?!.*:)\d+(?:-\d+)?$').hasMatch(row[i])) {
        return i;
      }
    }
  }
  return null;
}

isDay(List<String?> row, int? _end) {
  //the _end parrameter is for optimazion , it works by assuming that
  // there is no day name After the Lecture Location so it cuts the checking ,btw _end is the indexx of the Lecture index in a row
  if (_end == null) {
    _end = row.length;
  }
  for (int i = 0; i < _end; i++) {
    if (row[i] != null) {
      if (validDays.contains(row[i]!.toLowerCase())) {
        return row[i];
      }
    }
  }
  return null;
}

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

GetTimeRange(rows) {
  List<TimeRange> timerange = [];

  int count = 1;
  for (var row in rows) {
    if (timerange.isEmpty) {
      if (row.contains("Academic")) {
        timerange = _extract_times(row.sublist(count + 1));
        return timerange;
      }
    }
  }
}

List<TimeRange> _extract_times(List list) {
  List<TimeRange> _tmp = [];
  var _rangeTmp;
  for (String? range in list) {
    if (range != null) {
      _rangeTmp = range.split('-');
      _tmp.add(TimeRange(_rangeTmp[0], _rangeTmp[1]));
    }
  }
  return _tmp;
}
