import 'package:schedule_me/Class/Lecture.dart';
import 'StudentPref.dart';

/*class Timetable {
  final List<Lecture> _lectures = [];

  void addLecture(Lecture lecture) {
    if (!_hasConflict(lecture)) {
      _lectures.add(lecture);
    }
  }

  void addAllLecture(List<Lecture> lecture) {
    for (var item in lecture) {
        _lectures.add(item);
      /*if (!_hasConflict(item)) {
        _lectures.add(item);
      }*/
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
}*/
class Timetable {
  final List<Lecture> lectures = [];

  void addLecture(Lecture lecture) {
    if (!_hasConflict(lecture)) {
      lectures.add(lecture);
    }
  }

  bool _hasConflict(Lecture newLecture) {
    return lectures.any((l) => l.conflictsWith(newLecture));
  }

  int get totalDays => lectures.map((l) => l.day).toSet().length;
}
