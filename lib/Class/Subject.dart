class Subject {
  String Name;
  String Type;
  int Hours;
  String get name {
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

  Subject({ required this.Name,required this.Type,required this.Hours}) {
    this.Name = name;
    this.Type = type;
    this.Hours = hours;
  }
}
