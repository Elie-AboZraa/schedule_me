import 'package:schedule_me/Class/Subject.dart';

void reapplySort(Map<String, String> sortCache, searchedList) {
  if (sortCache.isNotEmpty) sortBy(sortCache, searchedList);
}

void sortBy(Map<String, String> map, List<Subject> searchedList) {
  //sortCache = map;
  if (map.keys.first == "sortBy") {
    if (map["sortBy"] == "اسم") {
      searchedList.sort((a, b) => a.name!.compareTo(b.name!));
    } else if (map["sortBy"] == "عدد الساعات") {
      searchedList.sort((a, b) => b.hours!.compareTo(a.hours!));
    }
  }
}
