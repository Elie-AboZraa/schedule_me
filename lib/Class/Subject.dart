import 'package:schedule_me/Class/TimeOfLecture.dart';
enum Day {
  sunday,monday,tuseday,wednsday,thirsday,friday
}
class Subject {
  //somthing like statistecs not the real data
  String Name;
  String Type;
  int Hours;
  

  //the real data that going to be putened in a scedual
  //basicly we are mapping Saterday : the time of lecture in this day 
  Map<Day, TimeOfLecture> Scedual_Data;

  String get nameOfSubject {
    return Name;
  }

  set name(value) {
    Name = value;
  }

  String get type {
    return Type;
  }

  set type(value) {
    Type = value;
  }

  int get hours {
    return Hours;
  }

  set hours(value) {
    Hours = value;
  }

  Subject({
    required this.Name,
    required this.Type,
    required this.Hours,
    required this.Scedual_Data,
  }) ;
}
