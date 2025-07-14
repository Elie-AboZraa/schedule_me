import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Helpers/_GenerateColors.dart';

generateColorCoat(Subject subject) {
  var color = getRandomCoolLightHSLColor().toColor();
  subject.color = color;
  for (var lecture in subject.Th_lectures) {
    lecture.color = color;
  }

  for (var lecture in subject.Lp_lectures) {
    lecture.color = color;
  }
}
