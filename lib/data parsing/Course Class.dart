import 'package:schedule_me/data%20parsing/Group%20Class.dart';

class Course {
  final String? courseCode;
  final String? name;
  final int? credits;
  final List<Group> groupsT;
  final List<Group> groupsP;

  Course({
    this.courseCode,
    this.name,
    this.credits,
    required this.groupsT,
    required this.groupsP,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseCode: json['COURSE_CODE'] as String?,
      name: json['COURSE_NAME_PL'] as String?,
      credits: json['COURSE_CREDITS'] as int?,
      groupsT: (json['COURSE_GROUPS_T'] as List<dynamic>? ?? [])
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupsP: (json['COURSE_GROUPS_P'] as List<dynamic>? ?? [])
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'COURSE_CODE': courseCode,
        'COURSE_NAME_PL': name,
        'COURSE_CREDITS': credits,
        'COURSE_GROUPS_T': groupsT.map((g) => g.toJson()).toList(),
        'COURSE_GROUPS_P': groupsP.map((g) => g.toJson()).toList(),
      };
}
