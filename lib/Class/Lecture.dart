import 'TimeRange.dart';

class Lecture {
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
}