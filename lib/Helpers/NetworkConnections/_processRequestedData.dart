import 'package:schedule_me/Class/Timetable.dart';

processRequestedData(json){
  if (json["success"])
  for(var item in json["data"]["COURSES"])
  {
    print(item["COURSE_NAME"]);
    print(item["REQUIREMENT_TYPE_SL"]);
    print(item["ROOM_CODE"]);
    print(item["NEED_T_GROUP"]);
    print(item["NEED_P_GROUP"]);
    print(item["NEED_C_GROUP"]);
    print(item["NEED_C_GROUP"]);
    print(item["NEED_C_GROUP"]);
  }
return Timetable();
}
