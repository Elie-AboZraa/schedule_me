import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future GetLectureRequest(LoginResponse) async {
  String url = 'http://185.194.126.86/RAS/api/lrn/registration/openedCourses?lang=ar';
  url="$url&lang=ar";
  url="$url&level="+LoginResponse["data"]["EXTRA"]["END_LEVEL_NAME_SHORT"].toString();
  url="$url&studyMode="+LoginResponse["data"]["EXTRA"]["STUDY_MODE_CODE"].toString();
  url="$url&passedCredits="+LoginResponse["data"]["EXTRA"]["START_TOTAL_IN_CREDITS"].toString();
  //url="$url&degreeId="+LoginResponse["data"]["EXTRA"]["DEGREE_ID"].toString();
  final headers = {
    'Accept-Charset': 'UTF-8',
    'userTypeCode': 'STUDENT',
    'osType': 'ANDROID',
    'token': LoginResponse["data"]["TOKEN"].toString(),
    'User-Agent':
        'Dalvik/2.1.0 (Linux; U; Android 9; none Build/QP1A.190711.020)',
  };
  // Trying to process Network Errors and Decoding
  try {
    final response = await http.get(Uri.parse(url), headers: headers);

    try {
      return jsonDecode(response.body);
    } catch (e) {
      FlutterError("Error Decoding to Json Data");
      return {"success": false, "error": "Error Decoding to Json Data"};
    }
  } on SocketException catch (_) {
    return {"success": false, "error": 'No internet connection.'};
  } catch (e) {
    return {"success": false, "error": '$e'};
  }
    

}
