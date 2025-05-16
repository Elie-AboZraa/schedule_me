List<Timetable> generatePossibleTimetables(List<Lecture> selectedLectures) {
  List<Timetable> validTimetables = [];
  backtrack([], selectedLectures, validTimetables);
  return validTimetables;
}

void backtrack(List<Lecture> current, List<Lecture> remaining, List<Timetable> results) {
  if (remaining.isEmpty) {
    results.add(Timetable(lectures: current));
    return;
  }
  Lecture next = remaining.removeAt(0);
  if (!hasTimeConflict(current, next)) {
    backtrack([...current, next], remaining, results);
  }
  backtrack(current, remaining, results);
}