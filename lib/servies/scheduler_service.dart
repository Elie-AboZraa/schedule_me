import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/StudentPref.dart';
import 'package:schedule_me/Class/LectureTable.dart';

class SchedulerService {
  final List<Lecture> allLectures;
  final StudentPref prefs;

  SchedulerService({required this.allLectures, required this.prefs});

  // Generate all valid schedules
  List<LectureTable> generateAllPossible() {
    List<LectureTable> LectureTables = [];
    _backtrack(LectureTable(), 0, LectureTables);
    return LectureTables;
  }

 void _backtrack(LectureTable current, int index, List<LectureTable> results) {
  if (index == allLectures.length) {
    results.add(current);
    return;
  }

  // Skip lecture
  _backtrack(current, index + 1, results);

  // Include lecture if no conflict
  final newLectureTable = LectureTable()
    ..lectures.addAll(current.lectures);
    
  // Change from _hasConflict to hasConflict
  if (!newLectureTable.hasConflict(allLectures[index])) {
    newLectureTable.addLecture(allLectures[index]);
    _backtrack(newLectureTable, index + 1, results);
  }
}

  // Filter by preferences
  List<LectureTable> filterByPreferences(List<LectureTable> LectureTables) {
    return LectureTables.where((t) {
      return t.totalDays <= prefs.maxDays &&
          (prefs.preferredDays.isEmpty ||
              t.lectures.every((l) => prefs.preferredDays.contains(l.day)));
    }).toList();
  }

  // Find best schedule
  LectureTable findBest() {
    final possible = generateAllPossible();
    final filtered = filterByPreferences(possible);
    return filtered.isEmpty ? LectureTable() : filtered.first;
  }
}