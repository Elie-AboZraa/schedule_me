import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Class/SubjectTable.dart';
import 'package:schedule_me/Helpers/_SortSubjectBy.dart';

void searchTheSubjectTable(
  String text,
  List<Subject> searchedList,
  Map<String, String> sortCache,
) {
  var subjectlist = SubjectTable().Subject_list;
  searchedList.clear();
  for (var i = 0; i < subjectlist.length; i++) {
    if (subjectlist[i].name!.toLowerCase().contains(text.toLowerCase())) {
      searchedList.add(subjectlist[i]);
    }
  }
  print(sortCache);
  reapplySort(sortCache, searchedList);
}
