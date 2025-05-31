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
// lib/classes/Lecture.dart
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

  // Optional: Override toString() for debugging
  @override
  String toString() => 
      'Lecture($subject, $teacher, $academicTime, $classroom, $day)';
}