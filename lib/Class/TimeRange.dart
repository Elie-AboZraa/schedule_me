class TimeRange {
  final String start;
  final String end;

  TimeRange(this.start, this.end);

  // Check if two time ranges overlap
  bool overlapsWith(TimeRange other) {
    return start.compareTo(other.end) < 0 && end.compareTo(other.start) > 0;
  }
}