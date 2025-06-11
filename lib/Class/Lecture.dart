class Lecture {
  final String? subject;
  final String? teacher;
  final String? academicTime;
  //lecture_repetition= الشعبة
  final String? lecture_repetition;
  final String? classroom;
  final String? day;

  Lecture({
    required this.subject,
    required this.lecture_repetition,
    required this.day,
    required this.academicTime,
    required this.classroom,
    required this.teacher,
  });
  /// Parses time string (e.g., "8:00-10:00") into DateTime ranges
  List<DateTime> _parseTime(String timeString) {
    final parts = timeString.split('-');
    if (parts.length != 2) return [];

    try {
      final startTime = _parseSingleTime(parts[0]);
      final endTime = _parseSingleTime(parts[1]);
      return [startTime, endTime];
    } catch (e) {
      return [];
    }
  }

  DateTime _parseSingleTime(String time) {
    final components = time.split(':');
    final hour = int.parse(components[0]);
    final minute = components.length > 1 ? int.parse(components[1]) : 0;
    return DateTime(2000, 1, 1, hour, minute);
  }

  /// NOT WORKING , hade to comment
  /// Checks if this lecture conflicts with another lecture
  /*bool conflictsWith(Lecture other) {
    if (this.day != other.day) return false;
    
    final thisTime = _parseTime(this.academicTime);
    final otherTime = _parseTime(other.academicTime);
    
    if (thisTime.isEmpty || otherTime.isEmpty) return false;
    
    return thisTime[0].isBefore(otherTime[1]) && 
           thisTime[1].isAfter(otherTime[0]);
  }*/

  @override
  String toString() {
    return 'Lecture($subject, $teacher, $academicTime, $classroom, $day)';
  }
  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'academicTime': academicTime.toString(),
      'teacher': teacher.toString(),
      'classroom': classroom.toString(),
      'day': day.toString(),
    };
  }
}