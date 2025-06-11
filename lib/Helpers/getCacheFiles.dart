import 'dart:io';
import 'package:schedule_me/Class/CacheDir.dart';

Future<List<File>?> getCacheFiles({
  Directory? subDirectory,
  String? fileExtention,
}) async {
  //search some path and get files
  //if no files exist return null
  //getApplicationDocumentsDirectory

  
  List<File> list_Serulized_Schedules = [];
  if (subDirectory != null) {
    if (fileExtention == null) {
      await subDirectory.list().forEach((file) {
        if (file is File) (list_Serulized_Schedules.add(file));
      });
    } else {
      await subDirectory.list().forEach((file) {
        if (file is File && file.path.endsWith(fileExtention))
          (list_Serulized_Schedules.add(file));
      });
    }
  }
  return list_Serulized_Schedules;
}
