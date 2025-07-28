import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class CacheDir {
  String? university;
  String? facility;
  // Singleton instance
  static final CacheDir _instance = CacheDir._internal();
  bool is_initilized = false;
  factory CacheDir() => _instance;

  CacheDir._internal();

  Directory? _directory;

  Future<bool> init(String subDirectory) async {
    if (_directory != null) return false; // Already initialized

    _directory = await _initializeCacheDirectory(subDirectory);
    is_initilized = true;
    return true;
  }

  Future<Directory> _initializeCacheDirectory(String subDirectory) async {
    late Directory baseDir;

    if (Platform.isAndroid || Platform.isIOS) {
      baseDir = await getApplicationDocumentsDirectory();
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      baseDir = await getApplicationSupportDirectory();
    } else {
      baseDir = await getApplicationDocumentsDirectory();
    }

    String fullPath;

    if (subDirectory.startsWith(p.separator)) {
      fullPath = p.join(baseDir.path, subDirectory);
    } else {
      fullPath = p.join(baseDir.path, subDirectory);
    }

    final dir = Directory(fullPath);

    try {
      if (!(await dir.exists())) {
        dir.createSync(recursive: true);
      }
    } catch (e) {
      FlutterError.reportError(
        FlutterErrorDetails(exception: "Failed to create cache directory: $e"),
      );
    }

    return dir;
  }

  void saveCSVFile(File f) {
    var d = Directory(directory.path + '/UserDatabase/');
    d.createSync(recursive: true);

    f.copySync(d.path + p.basename(f.path));
  }

  saveScheduleAsJson(String jsonString, String filename) {
    var d = Directory(directory.path + '/UserScheduals/');
    d.createSync(recursive: true);
    File(d.path + filename).writeAsString(jsonString);
  }

  DeleteJsonSchedule(String filename) {
    var d = Directory(directory.path + '/UserScheduals/');
    d.createSync(recursive: true);
    File(d.path + filename).delete();
  }

  Future<List<File>?> getCacheFiles({
    String? baseDirectory,
    String? subDirectory,
    String? fileExtention,
  }) async {
    //search some path and get files
    //if no files exist return null
    //getApplicationDocumentsDirectory

    if (baseDirectory != null) {
      //then its not initilized
      var _tmp = baseDirectory.toLowerCase().split("/");
      university = _tmp[0];
      facility = _tmp[1];
      await init(baseDirectory);
    }

    List<File> list_Serulized_Schedules = [];
    if (subDirectory == null) {
      return list_Serulized_Schedules;
    }
    var targetDirectory = Directory(CacheDir().directory.path + subDirectory);
    if (!await targetDirectory.exists()) {
      await targetDirectory.create();
      return list_Serulized_Schedules;
    }

    if (fileExtention == null) {
      await targetDirectory.list().forEach((file) {
        if (file is File) (list_Serulized_Schedules.add(file));
      });
    } else {
      await targetDirectory.list().forEach((file) {
        if (file is File && file.path.endsWith(fileExtention))
          (list_Serulized_Schedules.add(file));
      });
    }

    return list_Serulized_Schedules;
  }

  Directory get directory {
    if (_directory == null) {
      throw StateError(
        "CacheDir not initialized. Call CacheDir().init() first.",
      );
    }
    return _directory!;
  }
}
