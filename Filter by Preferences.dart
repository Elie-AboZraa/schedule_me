List<Timetable> filterTimetables(List<Timetable> timetables, StudentPref prefs) {
  return timetables.where((t) {
    int days = t.lectures.map((l) => l.day).toSet().length;
    return days <= prefs.maxDays &&
           checkTimePreferences(t, prefs) &&
           checkBackToBack(t, prefs);
  }).toList();
}