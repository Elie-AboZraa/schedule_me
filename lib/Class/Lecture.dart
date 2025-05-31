import 'TimeRange.dart';
//v1
/*class Lecture {
  final String _subject;
  //final String _section;
  final String _day;
  final String _location;
  //final String _lecturer;
  final TimeRange _time;

  Lecture({
    required String subject,
    //required String section,
    required String day,
    required String location,
//    required String lecturer,
    required TimeRange time,
  })  : _subject = subject,
      //  _section = section,
        _day = day,
        _location = location,
  //      _lecturer = lecturer,
        _time = time;

  // Public getters
  String get subject => _subject;
  TimeRange get time => _time;
  String get day => _day;

  bool conflictsWith(Lecture other) {
    return _day == other._day && _time.overlapsWith(other._time);
  }
}*/

//v2
/*class Lecture {
  final String subject;
  final String section;
  final String day;
  final TimeRange time;
  final String? location;
  final String? lecturer;

  Lecture({
    required this.subject,
    required this.section,
    required this.day,
    required this.time,
    this.location,
    this.lecturer,
  });

  @override
  String toString() {
    return '$subject (Sec $section) - $day ${time.start}-${time.end}';
  }

  bool conflictsWith(Lecture other) {
    return day == other.day && time.overlapsWith(other.time);
  }
}*/
//v3
class Lecture {
  final String subject;
  final String teacher;
  final String academicTime;
  final String classroom;
  final String day;

  Lecture({
    required this.subject,
    required this.teacher,
    required this.academicTime,
    required this.classroom,
    required this.day,
  });

  /// Parses time string (e.g., "8:00-10:00") into DateTime ranges
  List<DateTime> _parseTime(String timeString) {
    final parts = timeString.split('-');
    if (parts.length != 2) return [];

    try {
      final startTime = _parseSingleTime(parts[0]);
      final endTime = _parseSingleTime(parts[1]);
      return [startTime, endTime];
    } catch (e) {
      return [];
    }
  }

  DateTime _parseSingleTime(String time) {
    final components = time.split(':');
    final hour = int.parse(components[0]);
    final minute = int.parse(components[1]);
    
    // Using arbitrary date (2000-01-01) since we only care about time
    return DateTime(2000, 1, 1, hour, minute);
  }

  /// Checks if this lecture conflicts with another lecture
  bool conflictsWith(Lecture other) {
    if (this.day != other.day) return false; // Different days = no conflict
    
    final thisTime = _parseTime(this.academicTime);
    final otherTime = _parseTime(other.academicTime);
    
    if (thisTime.isEmpty || otherTime.isEmpty) return false; // Invalid times
    
    // Check for time overlap
    return thisTime[0].isBefore(otherTime[1]) && 
           thisTime[1].isAfter(otherTime[0]);
  }

  @override
  String toString() {
    return 'Lecture($subject, $teacher, $academicTime, $classroom, $day)';
  }
}