import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_me/schedule_extractor.dart';

void main() {
  test('Extracts data from schedule.txt', () async {
    final lectures = await extractLecturesFromText('test/schedule.txt');
    expect(lectures, isNotEmpty);
    expect(lectures.first.subject, contains('الخوارزميات')); // Sample check
  });
}