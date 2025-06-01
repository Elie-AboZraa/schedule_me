import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_me/pdf_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Future<Schedule> _scheduleFuture;

  @override
  void initState() {
    super.initState();
    _scheduleFuture = _loadSchedule();
  }

  Future<Schedule> _loadSchedule() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/schedule.txt');
    
    // If file doesn't exist, create it from assets
    if (!await file.exists()) {
      final data = await rootBundle.load('assets/schedule.pdf');
      await file.writeAsBytes(data.buffer.asUint8List());
    }
    
    final lines = await file.readAsLines();
    return parsePdfContent(lines);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Schedule>(
      future: _scheduleFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          final schedule = snapshot.data!;
          
          return ListView.builder(
            itemCount: schedule.lectures.length,
            itemBuilder: (context, index) {
              final lecture = schedule.lectures[index];
              return ListTile(
                title: Text(lecture.subject),
                subtitle: Text('${lecture.teacher} - ${lecture.classroom}'),
                trailing: Text('${lecture.academicTime}\n${lecture.day}'),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}