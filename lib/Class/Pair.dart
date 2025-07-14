import 'package:schedule_me/Class/Lecture.dart';

class Pair {
  Lecture? l1;
  Lecture? l2;
  late bool full;
  Pair({this.l1, this.l2}) {
    if (l1 == null || l2 == null) {
      full = false;
    } else {
      full = true;
    }
  }
}
