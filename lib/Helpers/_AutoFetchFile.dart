import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:schedule_me/Class/CacheDir.dart';
import 'package:http/http.dart' as http;

autoFetchFile(Function updateUi) async {
  var cacheDir = CacheDir();
  //var files = cacheDir.getAutoFetchFiles();
  var data = await getLatestRelease();
  if (data == null) {
    return;
  }
  for (var asset in data!["assets"]) {
    if (asset["name"].toString().contains(
      '${cacheDir.university}_${cacheDir.facility}',
    )) {
      File(
        "${CacheDir().directory.path}/UserDatabase/تنزيل_تلقائي${asset["name"]}",
      ).writeAsBytes(
        await http.readBytes(Uri.parse(asset["browser_download_url"])),
      );
    }
  }
  updateUi.call();
  //ToDo : show a warning that the parsing failed
}

Future<Map<String, dynamic>?> getLatestRelease() async {
  try {
    final url =
        'https://api.github.com/repos/Elie-AboZraa/schedule_me/releases/latest';

    final response = await http
        .get(
          Uri.parse(url),
          headers: {'Accept': 'application/vnd.github.v3+json'},
        )
        .timeout(Duration(seconds: 15));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to get latest release: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error getting latest release: $e');
    return null;
  }
}
