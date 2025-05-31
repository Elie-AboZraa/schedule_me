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
// lib/core/services/timetable.dart
class Timetable {
  final List<Lecture> lectures = [];

  // Change from _hasConflict to hasConflict (remove underscore)
  bool hasConflict(Lecture newLecture) {
    return lectures.any((l) => l.conflictsWith(newLecture));
  }

  void addLecture(Lecture lecture) {
    if (!hasConflict(lecture)) {
      // Update this line too
      lectures.add(lecture);
    }
  }

  void addAllLecture(List<Lecture> list) {
    for (var element in list) {
      lectures.add(element);
    }
  }

  int get totalDays => lectures.map((l) => l.day).toSet().length;
}
