import 'package:schedule_me/Class/Lecture.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:schedule_me/Class/TimeRange.dart';

class Schedule {
  final List<Lecture> lectures;
  Schedule({required this.lectures});
}

class PdfParser {
  static Future<Schedule> parsePdfContent(String pdfPath) async {
    try {
      final pdfDoc = await PDFDoc.fromPath(pdfPath);
      final text = await pdfDoc.text;
      final lines = text.split('\n');
      
      final lectures = <Lecture>[];
      String? currentDay;
      TimeRange? currentTime;
      String? currentLocation;

      for (int i = 0; i < lines.length; i++) {
        final line = lines[i].trim();

        // 1. Detect day headers (supports Arabic/English)
        if (_isDayHeader(line)) {
          currentDay = _normalizeDay(line);
          continue;
        }

        // 2. Detect time slots (supports both "Academic" and "Actual")
        final timeRange = _parseTimeRange(line);
        if (timeRange != null) {
          currentTime = timeRange;
          continue;
        }

        // 3. Detect locations (rooms and labs)
        if (_isLocation(line)) {
          currentLocation = line;
          continue;
        }

        // 4. Parse lecture lines (Arabic text with section numbers)
        if (currentDay != null && currentTime != null && _isLectureLine(line)) {
          final lecture = _createLecture(
            line: line,
            day: currentDay,
            time: currentTime,
            location: currentLocation,
          );
          
          if (lecture != null) {
            lectures.add(lecture);
          }
        }
      }

      return Schedule(lectures: lectures);
    } catch (e) {
      throw Exception('Failed to parse PDF: ${e.toString()}');
    }
  }

  // ===== Helper Methods (Keep these private) =====
  static bool _isDayHeader(String line) {
    return line.contains(RegExp(
      r'(السبت|الأحد|الإثنين|الثلاثاء|الأربعاء|الخميس|الجمعة|Saturday|Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Day)',
    ));
  }

  static String _normalizeDay(String day) {
    // Converts Arabic days to English
    final arabicToEnglish = {
      'السبت': 'Saturday',
      'الأحد': 'Sunday',
      'الإثنين': 'Monday',
      'الثلاثاء': 'Tuesday',
      'الأربعاء': 'Wednesday',
      'الخميس': 'Thursday',
      'الجمعة': 'Friday',
    };
    return arabicToEnglish[day] ?? day;
  }

  static TimeRange? _parseTimeRange(String line) {
    final timeRegex = RegExp(r'(\d{1,2}:\d{2})\s*-\s*(\d{1,2}:\d{2})');
    final match = timeRegex.firstMatch(line);
    return match != null ? TimeRange(match.group(1)!, match.group(2)!) : null;
  }

  static bool _isLocation(String line) {
    return RegExp(r'^\d{4}$').hasMatch(line) || 
           line.startsWith('مخبر');
  }

  static bool _isLectureLine(String line) {
    return line.contains(RegExp(r'[\u0600-\u06FF]')) && 
           line.contains(RegExp(r'ش\d*'));
  }

  static Lecture? _createLecture({
    required String line,
    required String day,
    required TimeRange time,
    required String? location,
  }) {
    try {
      final sectionMatch = RegExp(r'ش\s*(\d+)').firstMatch(line);
      final subject = line.replaceAll(RegExp(r'ش\s*\d+'), '').trim();

      return Lecture(
        subject: subject,
        teacher: _extractProfessor(lines, line), // Added professor extraction
        academicTime: '${time.start}-${time.end}',
        classroom: location ?? 'Unknown',
        day: day,
      );
    } catch (e) {
      print('Error parsing lecture: $e');
      return null;
    }
  }

  static String? _extractProfessor(List<String> lines, String currentLine) {
    final professorRegex = RegExp(r'(د\.|م\.|هـ\.ت)\s*\w+');
    final lineIndex = lines.indexOf(currentLine);
    
    // Check next 3 lines for professor names
    for (int i = lineIndex + 1; i <= lineIndex + 3; i++) {
      if (i < lines.length) {
        final match = professorRegex.firstMatch(lines[i]);
        if (match != null) return match.group(0);
      }
    }
    return null;
  }
}