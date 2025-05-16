Timetable findBestTimetable(List<Timetable> timetables) {
  return timetables.reduce((best, current) =>
      current.score > best.score ? current : best);
}