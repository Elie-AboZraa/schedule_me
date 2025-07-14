import 'package:schedule_me/Class/Lecture.dart';
import 'package:schedule_me/Class/Pair.dart';
import 'package:schedule_me/Class/Subject.dart';

const List<String> validDays = [
  "Friday",
  "Thursday",
  "Wednesday",
  "Tuesday",
  "Monday",
  "Sunday",
  "Saturday",
];

class ScheduleGenerator {
  List<Subject> selectedSubjects;
  Map<int, List<Pair>> pairs = {};
  /*sub1:[Pair(),Pair()],sub2:[Pair(),Pair()]*/
  bool done = false;
  //TO-DO Optimzation: enum the days to int so the map look like  Map<int, Map<String, String>>
  Map<String, Map<String, Lecture>> select = {};
  /*Saterday:{timerange:lectureID,timerange:lectureID,timerange:lectureID} */
  /*Sunday:{timerange0:lectureID,timerange1:lectureID,timerange2:lectureID} */
  /*Result: no two timeranges lectures in the same day  */
  List<int> counter = [];
  List<int> ranges = [];

  //this variable exsist to include the schedual of counter [0,0,0.....0,0,0]
  ScheduleGenerator({required this.selectedSubjects}) {
    _initPairs();
    _initSelectedMap();
    _initCounterandRange();
  }
  currentGeneratedSchedual() {
    return select;
  }

  Map<String, Map<String, Lecture>>? generateNextSchedual() {
    if (done) {
      return null;
    }
    var tmp = _createSchedualForSelectedPairs(_pickPairs());
    return tmp;
  }

  Map<String, Map<String, Lecture>> deepCloneWithLectureCopy() {
    Map<String, Map<String, Lecture>> clone = {};

    select.forEach((dayKey, lecturesMap) {
      var innerClone = <String, Lecture>{};
      lecturesMap.forEach((lectureId, lecture) {
        innerClone[lectureId] = lecture.copy();
      });
      clone[dayKey] = innerClone;
    });

    return clone;
  }

  List<Pair> _pickPairs() {
    List<Pair> result = [];
    for (var i = 0; i < counter.length; i++) {
      var index = counter[i];
      result.add(pairs[i]![index]);
    }
    return result;
  }

  Map<String, Map<String, Lecture>>? _createSchedualForSelectedPairs(
    List<Pair> pickedPairs,
  ) {
    if (done) {
      return null;
    }
    for (var key in select.keys) {
      select[key]!.clear();
    }
    for (var i = 0; i < pickedPairs.length; i++) {
      //print(counter);
      var pair = pickedPairs[i];

      if (pair.full == false) {
        Lecture l;
        (pair.l2 == null) ? l = pair.l1! : l = pair.l2!;
        var timerange = '${l.academicTimeStart!}-${l.academicTimeEnd!}';
        if (select[l.day!]![timerange] != null) {
          if (!_incrementCounter()) {
            print("no good soulotion were found");
            done = true;
            return null;
          }
          pickedPairs = _pickPairs();
          i--;
          continue;
        }
        //        select[l.day!]![timerange] = '$timerange\n${l.repetition!}${l.type!}';

        select[l.day!]![timerange] = l;
        continue;
      }

      var timeRangeTh =
          '${pair.l1!.academicTimeStart!}-${pair.l1!.academicTimeEnd!}';
      var timeRangeLp =
          '${pair.l2!.academicTimeStart!}-${pair.l2!.academicTimeEnd!}';

      if (select[pair.l2!.day!]![timeRangeLp] != null ||
          select[pair.l1!.day!]![timeRangeTh] != null ||
          (timeRangeTh == timeRangeLp && pair.l1!.day == pair.l2!.day)) {
        if (!_incrementCounter()) {
          print("no good soulotion were found");
          done = true;
          return null;
        }
        pickedPairs = _pickPairs();
        i--;
        continue;
      }
      /*
        old implemintaion if we needed to make schedual with missing subject 
      //Checking conflect , if there is a conflect with other lectures ignore the pair(subject)
      if (select[pair.l2!.day!]![timeRangeLp] != null ||
          select[pair.l1!.day!]![timeRangeTh] != null) {
        continue;
      }*/ /*
      select[pair.l2!.day!]![timeRangeLp] =
          '$timeRangeLp\n${pair.l2!.repetition!}${pair.l2!.type!}';
      select[pair.l1!.day!]![timeRangeTh] =
          '$timeRangeTh\n${pair.l1!.repetition!}${pair.l1!.type!}';*/

      select[pair.l2!.day!]![timeRangeLp] = pair.l2!;
      select[pair.l1!.day!]![timeRangeTh] = pair.l1!;
    }
    _incrementCounter();
    return select;
  }

  bool _incrementCounter() {
    int i = counter.length - 1;
    while (i >= 0) {
      if (counter[i] < ranges[i]) {
        counter[i] += 1;
        break;
      } else {
        counter[i] = 0;
        i -= 1;
      }
    }
    // If we wrapped all the way left, it means overflow (all maxed out)
    if (i < 0) {
      done = true;
      return false; // Indicates overflow
    }
    return true;
  }

  _initCounterandRange() {
    for (var i = 0; i < selectedSubjects.length; i++) {
      counter.add(0);
      ranges.add(pairs[i]!.length - 1);
    }
  }

  void _initSelectedMap() {
    for (var day in validDays) {
      select[day] = {};
    }
  }

  _initPairs() {
    //Create Pairs of th,lp , the goal is to deal with pairs not with lecturs dou to complexity and computaion demand
    for (var i = 0; i < selectedSubjects.length; i++) {
      pairs[i] = [];
      if (selectedSubjects[i].Th_lectures.isEmpty) {
        //if the subject is only theoretical
        for (var l in selectedSubjects[i].Lp_lectures) {
          pairs[i]!.add(Pair(l2: l));
        }
      } else if (selectedSubjects[i].Lp_lectures.isEmpty) {
        //if the subject is only in Lap
        for (var l in selectedSubjects[i].Th_lectures) {
          pairs[i]!.add(Pair(l2: l));
        }
      } else {
        for (var j = 0; j < selectedSubjects[i].Th_lectures.length; j++) {
          for (var k = 0; k < selectedSubjects[i].Lp_lectures.length; k++) {
            pairs[i]!.add(
              Pair(
                l1: selectedSubjects[i].Th_lectures[j],
                l2: selectedSubjects[i].Lp_lectures[k],
              ),
            );
          }
        }
      }
    }
  }
}
