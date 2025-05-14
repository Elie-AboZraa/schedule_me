// This class just to define the time of a subject in the data
// for example: Scedual_data.add("web Design", new Time(start:"08:00",end:"11:00"))
class TimeOfLecture {
  String Start;
  String End;

  String get start {
    return Start;
  }

  set start(String start) {
    Start = start;
  }

  String get end {
    return End;
  }

  set end(String end) {
    End = end;
  }

  TimeOfLecture({required this.Start, required this.End}) {
    this.Start = start;
    this.End = end;
  }
}
