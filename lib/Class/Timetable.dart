import 'package:schedule_me/Class/Lecture.dart';
import 'StudentPref.dart';

class Timetable {
  final List<Lecture> _lectures = [];

  void addLecture(Lecture lecture) {
    if (!_hasConflict(lecture)) {
      _lectures.add(lecture);
    }
  }

  bool _hasConflict(Lecture newLecture) {
    return _lectures.any((lecture) => lecture.conflictsWith(newLecture));
  }

  bool isValid(StudentPref prefs) {
    final days = _lectures.map((l) => l.day).toSet().length;
    return days <= prefs.maxDays;
  }

  // Public getter
  List<Lecture> get lectures => List.unmodifiable(_lectures);
}