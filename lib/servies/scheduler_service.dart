import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/StudentPref.dart';
import 'package:schedule_me/Class/Timetable.dart';

class SchedulerService {
  final List<Lecture> allLectures;
  final StudentPref prefs;

  SchedulerService({required this.allLectures, required this.prefs});

  // Generate all valid schedules
  List<Timetable> generateAllPossible() {
    List<Timetable> timetables = [];
    _backtrack(Timetable(), 0, timetables);
    return timetables;
  }

 void _backtrack(Timetable current, int index, List<Timetable> results) {
  if (index == allLectures.length) {
    results.add(current);
    return;
  }

  // Skip lecture
  _backtrack(current, index + 1, results);

  // Include lecture if no conflict
  final newTimetable = Timetable()
    ..lectures.addAll(current.lectures);
    
  // Change from _hasConflict to hasConflict
  if (!newTimetable.hasConflict(allLectures[index])) {
    newTimetable.addLecture(allLectures[index]);
    _backtrack(newTimetable, index + 1, results);
  }
}

  // Filter by preferences
  List<Timetable> filterByPreferences(List<Timetable> timetables) {
    return timetables.where((t) {
      return t.totalDays <= prefs.maxDays &&
          (prefs.preferredDays.isEmpty ||
              t.lectures.every((l) => prefs.preferredDays.contains(l.day)));
    }).toList();
  }

  // Find best schedule
  Timetable findBest() {
    final possible = generateAllPossible();
    final filtered = filterByPreferences(possible);
    return filtered.isEmpty ? Timetable() : filtered.first;
  }
}