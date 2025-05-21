import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> SendLoginRequest(String username, String password) async {
  final String url = 'http://185.194.126.86/RAS/api/user/auth/login?lang=ar';
  final String boundary = '00content0boundary00';
  final headers = {
    'Accept-Charset': 'UTF-8',
    'userTypeCode': 'STUDENT',
    'osType': 'ANDROID',
    'Content-Type': 'multipart/form-data; boundary=$boundary',
    'User-Agent':
        'Dalvik/2.1.0 (Linux; U; Android 9; none Build/QP1A.190711.020)',
  };

  final body =
      '''
--$boundary
Content-Disposition: form-data; name="userTypeCode"

STUDENT
--$boundary
Content-Disposition: form-data; name="username"

$username
--$boundary
Content-Disposition: form-data; name="password"

$password
--$boundary
Content-Disposition: form-data; name="withExtra"

N
--$boundary--
''';
  // Trying to process Network Errors and Decoding
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    
    try {
      return jsonDecode(response.body);
    } catch (e) {
      FlutterError("Error Decoding to Json Data");
      return {"success":false,"error":"Error Decoding to Json Data"};
    }
  } on SocketException catch (_) {
    return {"success":false,"error":'No internet connection.'};
  } catch (e) {
    return {"success":false,"error":'$e'};
  }
}
