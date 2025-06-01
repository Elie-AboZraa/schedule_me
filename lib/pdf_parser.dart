// lib/pdf_parser.dart
import 'package:schedule_me/Class/Lecture.dart';

class Schedule {
  final List<Lecture> lectures;
  Schedule({required this.lectures});
}

Schedule parsePdfContent(List<String> lines) {
  final lectures = <Lecture>[];
  String? currentDay;
  String? currentAcademicTime;

  const dayMarkers = ['Sunday', 'Monday', 'Teusday', 'Saturday'];
  final classroomRegex = RegExp(r'(\d{4}|مخبر \w+|هندية)');

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trim();

    // 1. Detect day changes
    if (dayMarkers.contains(line)) {
      currentDay = line;
      continue;
    }

    // 2. Detect academic time slots
    if (line.contains(RegExp(r'^\d{1,2}:\d{2}-\d{1,2}:\d{2}'))) {
      currentAcademicTime = line;
      continue;
    }

    // 3. Extract subject (Arabic text)
    if (line.contains(RegExp(r'[\u0600-\u06FF]'))) {
      final subject = line;
      String? teacher;
      String? classroom;

      // Look ahead 1-3 lines for teacher/classroom
      for (int j = i + 1; j < i + 4 && j < lines.length; j++) {
        final nextLine = lines[j].trim();
        
        // Check for teacher prefix
        if (nextLine.startsWith('د.') || 
            nextLine.startsWith('م.') || 
            nextLine.startsWith('هـ.ت')) {
          teacher = nextLine;
        }
        // Check for classroom code
        else if (classroomRegex.hasMatch(nextLine)) {
          classroom = classroomRegex.firstMatch(nextLine)?.group(0);
        }
      }

      if (subject.isNotEmpty && teacher != null && classroom != null) {
        lectures.add(Lecture(
          subject: subject,
          teacher: teacher,
          academicTime: currentAcademicTime ?? 'Unknown',
          classroom: classroom,
          day: currentDay ?? 'Unknown',
        ));
      }
    }
  }

  return Schedule(lectures: lectures);
}