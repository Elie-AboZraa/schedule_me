import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

Future<Directory>? InisilizeCacheDirectory({String? SubDirectory}) async {
  Directory CacheDir;
  if (Platform.isAndroid) {
    CacheDir = await getApplicationDocumentsDirectory();
  } else if (Platform.isLinux || Platform.isWindows) {
    CacheDir = await getApplicationSupportDirectory();
  } else if (Platform.isIOS | Platform.isMacOS) {
    //TO-DO Figer out the right directory for ios and mac
    CacheDir = await getApplicationSupportDirectory();
  } else {
    CacheDir = await getApplicationDocumentsDirectory();
  }
  if (SubDirectory != null) {
    //some time we add an extra / without noticing , so lets manage the situation
    //for a clean path , we made the subdirectorys in a folder called cache
    if (SubDirectory.startsWith("/")) {
      CacheDir = Directory(CacheDir.path +SubDirectory);
    } else {
      CacheDir = Directory(CacheDir.path + "/" + SubDirectory);

    }
  }
  try {
    if (!(await CacheDir.exists())) {
      CacheDir = await CacheDir.create();
    }
  } catch (error) {
    FlutterError("creating or getting Cache Folder Error , permissions? ");
  }

  return CacheDir;
}
