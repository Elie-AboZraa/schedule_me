import 'package:schedule_me/Helpers/NetworkConnections/_GetLectureRequest.dart';
import 'package:schedule_me/Pages/creating_schedules.dart';

void GetLectureFromTheServer(json) async{
  //To-Do
  //checkToken();
  if (json["data"]["TOKEN"] !=null)
    {var w= await GetLectureRequest(json);
  print(w);
    }
}
