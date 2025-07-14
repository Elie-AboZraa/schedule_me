// the point of this class is to difrintuate betwean the LectureTable which is the scheduals that is going to be extracted from the excel file
// and the Subject that are available to choose from
// for example : there is two lecture with the same name but are difrent in time and teacher
// the LectureTable will allow that
// the Subject will Not , it will count it as one subject , with two difrent lectures
import 'package:schedule_me/Class/Subject.dart';

class SubjectTable {
  SubjectTable._privateConstructor();

  static final SubjectTable _instance = SubjectTable._privateConstructor();

  factory SubjectTable() {
    return _instance;
  }
  void clear() {
    Subject_list.clear();
  }

  final List<Subject> Subject_list = [];
}
