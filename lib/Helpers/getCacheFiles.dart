import 'dart:io';


import 'package:schedule_me/Helpers/_InisilizeCacheDirectory.dart';

Future<List<File>?> getCacheFiles({
  String? subDirectory,
  String? fileExtention,
}) async {
  //search some path and get files
  //if no files exist return null
  //getApplicationDocumentsDirectory

  Directory? CacheDir = await InisilizeCacheDirectory(
    SubDirectory: subDirectory == (null) ? null : subDirectory.toString(),
  );
  List<File> list_Serulized_Schedules = [];
  if (CacheDir != null) {
    if (fileExtention == null) {
      await CacheDir.list().forEach((file) {
        if (file is File) (list_Serulized_Schedules.add(file));
      });
    } else {
      await CacheDir.list().forEach((file) {
        if (file is File && file.path.endsWith(fileExtention))
          (list_Serulized_Schedules.add(file));
      });
    }
  }
  return list_Serulized_Schedules;
}
