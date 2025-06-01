import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_me/pdf_parser.dart';

void main() {
  test('Parses PDF text into lectures', () async {
    final file = File('test/schedule.txt');
    final lines = await file.readAsLines();
    final schedule = parsePdfContent(lines);

    expect(schedule.lectures, isNotEmpty);
    print('Found ${schedule.lectures.length} lectures');
    
    // Print first 5 lectures
    for (final lecture in schedule.lectures.take(5)) {
      print('Subject: ${lecture.subject}');
      print('Teacher: ${lecture.teacher}');
      print('Time: ${lecture.academicTime}');
      print('Room: ${lecture.classroom}');
      print('Day: ${lecture.day}\n');
    }
    
    // Verify conflict detection
    if (schedule.lectures.length > 1) {
      final conflict = schedule.lectures[0].conflictsWith(schedule.lectures[1]);
      print('Conflict between first two lectures: $conflict');
    }
  });
}