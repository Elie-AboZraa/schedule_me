import 'dart:io';
import 'package:schedule_me/class/Lecture.dart';

/// Lightweight alternative to parse schedule.txt directly
Future<List<Lecture>> extractLecturesFromText(String filePath) async {
  final file = File(filePath);
  final lines = await file.readAsLines();
  final lectures = <Lecture>[];
  String? currentDay;
  String? currentTime;

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trim();

    // 1. Detect day headers
    if (['Sunday', 'Monday', 'Teusday', 'Saturday'].contains(line)) {
      currentDay = line;
      continue;
    }

    // 2. Detect time slots (e.g., "8:00-10:00")
    if (RegExp(r'^\d{1,2}:\d{2}-\d{1,2}:\d{2}').hasMatch(line)) {
      currentTime = line;
      continue;
    }

    // 3. Extract subject (Arabic text)
    if (line.contains(RegExp(r'[\u0600-\u06FF]'))) {
      final subject = line;
      String? teacher;
      String? room;

      // Scan next 3 lines for teacher/room
      for (int j = i + 1; j <= i + 3 && j < lines.length; j++) {
        final nextLine = lines[j].trim();
        if (nextLine.startsWith('د.') || nextLine.startsWith('م.')) {
          teacher = nextLine;
        } else if (RegExp(r'\d{4}|مخبر').hasMatch(nextLine)) {
          room = nextLine;
        }
      }

      if (teacher != null && room != null && currentDay != null && currentTime != null) {
        lectures.add(Lecture(
          subject: subject,
          teacher: teacher,
          academicTime: currentTime,
          classroom: room,
          day: currentDay,
        ));
      }
    }
  }

  return lectures;
}