import 'package:pdf_text/pdf_text.dart';

import 'Class Diagram and the code for it/Lecture.dart';
import 'Class Diagram and the code for it/TimeRange.dart';

class PdfParser {
  static Future<List<Lecture>> parseSchedule(String pdfPath) async {
  try {
    final pdfDoc = await PDFDoc.fromPath(pdfPath); // This should now work
    final text = await pdfDoc.text;
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
      // Detect day headers (e.g., "Saturday", "Sunday")
      if (_isDayHeader(line)) {
        currentDay = _normalizeDay(line);
        continue;
      }

      // Detect time slots (e.g., "8:00-10:00")
      final timeRange = _parseTimeRange(line);
      if (timeRange != null) {
        currentTimeRange = timeRange;
        continue;
      }

      // Detect location (room numbers)
      if (_isLocation(line)) {
        currentLocation = line.trim();
        continue;
      }

      // Parse lecture lines (Arabic text with section numbers)
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

  // Helper methods
  static bool _isDayHeader(String line) {
    return line.trim().toLowerCase().contains('day') ||
        ['saturday', 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday']
            .any((day) => line.trim().toLowerCase().contains(day.toLowerCase()));
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
    required TimeRange timeRange,
    required String? location,
  }) {
    // Extract subject and section (e.g., "الخوارزميات وبنى المعطيات ش1")
    final sectionMatch = RegExp(r'ش(\d+)').firstMatch(line);
    final section = sectionMatch?.group(1) ?? '1';
    
    final subject = line.replaceAll(RegExp(r'ش\d+'), '').trim();

    return Lecture(
      subject: subject,
      section: section,
      day: day,
      time: timeRange,
      location: location,
    );
  }
}