import 'dart:convert';

import 'package:schedule_me/Class/Lecture.dart';

Map<String, Map<String, dynamic>> toJsonMap(
  Map<String, Map<String, Lecture>> original,
) {
  Map<String, Map<String, dynamic>> jsonMap = {};

  original.forEach((outerKey, innerMap) {
    Map<String, dynamic> innerJsonMap = {};
    innerMap.forEach((innerKey, lecture) {
      innerJsonMap[innerKey] = lecture.toJson();
    });
    jsonMap[outerKey] = innerJsonMap;
  });

  return jsonMap;
}

Map<String, Map<String, Lecture>> fromJsonMap(String jsonString) {
  final dynamic data = jsonDecode(jsonString);
  final Map<String, Map<String, Lecture>> lectureMap = {};

  (data as Map<String, dynamic>).forEach((outerKey, innerMap) {
    final Map<String, Lecture> innerLectureMap = {};
    (innerMap as Map<String, dynamic>).forEach((innerKey, lectureJson) {
      innerLectureMap[innerKey] = Lecture.fromJson(
        lectureJson as Map<String, dynamic>,
      );
    });
    lectureMap[outerKey] = innerLectureMap;
  });

  return lectureMap;
}
