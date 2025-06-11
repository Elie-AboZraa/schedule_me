import 'package:schedule_me/data%20parsing/Course.dart';
import 'package:schedule_me/data%20parsing/Group.dart';

class LectureTableDataParser {
  final List<Course> courses;

  LectureTableDataParser({required this.courses});

  factory LectureTableDataParser.fromJson(Map<String, dynamic> json) {
    final coursesJson = json['data']?['COURSES'] as List<dynamic>? ?? [];
    final courses = coursesJson
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
    return LectureTableDataParser(courses: courses);
  }

  List<Course> getAllCourses() => courses;

  Course? findCourseByCode(String code) {
    try {
      return courses.firstWhere((course) => course.courseCode == code);
    } catch (e) {
      return null;
    }
  }

  List<Group> getAllGroups() =>
      courses.expand((course) => [...course.groupsT, ...course.groupsP]).toList();
}

