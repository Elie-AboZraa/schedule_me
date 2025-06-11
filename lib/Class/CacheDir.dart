import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class CacheDir {
  // Singleton instance
  static final CacheDir _instance = CacheDir._internal();

  factory CacheDir() => _instance;

  CacheDir._internal();

  Directory? _directory;

  Future<void> init(String subDirectory) async {
    if (_directory != null) return; // Already initialized

    _directory = await _initializeCacheDirectory(subDirectory);
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

  Directory get directory {

    if (_directory == null) {
      throw StateError("CacheDir not initialized. Call CacheDir().init() first.");
    }
    return _directory!;
  }

}