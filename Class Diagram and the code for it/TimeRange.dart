class TimeRange {
  final String _start;
  final String _end;

  TimeRange(this._start, this._end);

  // Public getters
  String get start => _start;
  String get end => _end;

  bool overlapsWith(TimeRange other) {
    return _start.compareTo(other._end) < 0 && 
           _end.compareTo(other._start) > 0;
  }
}