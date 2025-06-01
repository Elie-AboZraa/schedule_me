import 'dart:io';
import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/TimeRange.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';



class PdfParser {
  static Future<List<Lecture>> parseSchedule(String pdfPath) async {
    try {
      final bytes = File(pdfPath).readAsBytesSync();
      final PdfDocument document = PdfDocument(inputBytes: bytes);
      final String text = PdfTextExtractor(document).extractText();
      document.dispose();
      return _parseArabicSchedule(text);
    } catch (e) {
      print('PDF Parsing Error: $e');
      return [];
    }
  }

  static List<Lecture> _parseArabicSchedule(String text) {
    final lines = text.split('\n');
    final List<Lecture> lectures = [];
    String currentDay = '';
    TimeRange? currentTimeRange;
    String? currentLocation;

    for (final line in lines) {
      if (_isDayHeader(line)) {
        currentDay = _normalizeDay(line);
        continue;
      }

      final timeRange = _parseTimeRange(line);
      if (timeRange != null) {
        currentTimeRange = timeRange;
        continue;
      }

      if (_isLocation(line)) {
        currentLocation = line.trim();
        continue;
      }

      if (currentDay.isNotEmpty && currentTimeRange != null && _isLectureLine(line)) {
        lectures.add(_createLecture(
          line: line,
          day: currentDay,
          timeRange: currentTimeRange,
          location: currentLocation,
        ));
      }
    }

    return lectures;
  }

  static bool _isDayHeader(String line) {
    return line.trim().toLowerCase().contains('day') ||
        ['saturday', 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday']
            .any((day) => line.trim().toLowerCase().contains(day));
  }

  static String _normalizeDay(String dayLine) {
    final day = dayLine.trim().split(' ').first;
    return day.replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  static TimeRange? _parseTimeRange(String line) {
    final timeRegex = RegExp(r'(\d{1,2}:\d{2})\s*-\s*(\d{1,2}:\d{2})');
    final match = timeRegex.firstMatch(line);
    if (match != null) {
      return TimeRange(match.group(1)!, match.group(2)!);
    }
    return null;
  }

  static bool _isLocation(String line) {
    return RegExp(r'^\d{4}$').hasMatch(line.trim()) ||
           line.trim().startsWith('مخبر');
  }

  static bool _isLectureLine(String line) {
    return line.trim().isNotEmpty &&
           !_isDayHeader(line) &&
           !_isLocation(line) &&
           _parseTimeRange(line) == null;
  }

  static Lecture _createLecture({
    required String line,
    required String day,
    required String timeRange,
    required String? location,
  }) {
    final sectionMatch = RegExp(r'ش(\d+)').firstMatch(line);
    final section = sectionMatch?.group(1) ?? '1';
    final subject = line.replaceAll(RegExp(r'ش\d+'), '').trim();

    return Lecture(
      subject: subject,
      day: day,
      academicTime: timeRange ,
      classroom: location as String,
      teacher: "",
    );
  }
}
