import 'package:schedule_me/data%20parsing/Course%20Class.dart';
import 'package:schedule_me/data%20parsing/Group%20Class.dart';

class TimetableDataParser {
  final List<Course> courses;

  TimetableDataParser({required this.courses});

  factory TimetableDataParser.fromJson(Map<String, dynamic> json) {
    final coursesJson = json['data']?['COURSES'] as List<dynamic>? ?? [];
    final courses = coursesJson
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
    return TimetableDataParser(courses: courses);
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

