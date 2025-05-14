
import 'package:schedule_me/Class/Lecture.dart';

import 'StudentPref.dart';
import 'Timetable.dart';

class Scheduler {
  final List<Lecture> _allLectures;
  final StudentPref _prefs;

  Scheduler({required List<Lecture> lectures, required StudentPref prefs})
      : _allLectures = lectures,
        _prefs = prefs;

  List<Timetable> generate() {
    List<Timetable> possibleTimetables = [];
    _generateRecursive([], _allLectures, possibleTimetables);
    return possibleTimetables.where((t) => t.isValid(_prefs)).toList();
  }

  void _generateRecursive(List<Lecture> current, List<Lecture> remaining, List<Timetable> results) {
    if (remaining.isEmpty) {
      final timetable = Timetable();
      current.forEach(timetable.addLecture);
      results.add(timetable);
      return;
    }

    final next = remaining.removeAt(0);
    
    // Case 1: Include the lecture if no conflict
    if (!current.any((l) => l.conflictsWith(next))) {
      _generateRecursive([...current, next], remaining, results);
    }
    
    // Case 2: Exclude the lecture
    _generateRecursive(current, remaining, results);
  }

  Timetable findBest() {
    final candidates = generate();
    return candidates.reduce((best, current) =>
        current.lectures.length > best.lectures.length ? current : best);
  }
}