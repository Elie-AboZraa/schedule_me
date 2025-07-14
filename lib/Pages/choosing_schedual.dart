import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Class/SubjectTable.dart';
import 'package:schedule_me/Helpers/_GenerateColorCoatForSubjects.dart';
import 'package:schedule_me/Pages/lazyLoader.dart';
import 'package:schedule_me/Widgets/ColorSceamContainer.dart';

// to make a dynamic show , we need to make it to calculate the scheduals as needed by calculating four scheduals at a time
class ChooseSchedual extends StatefulWidget {
  final ChoosedSubjects;
  const ChooseSchedual({this.ChoosedSubjects, super.key});

  @override
  State<ChooseSchedual> createState() => _ChooseSchedualState();
}

class _ChooseSchedualState extends State<ChooseSchedual> {
  @override
  Widget build(BuildContext context) {
    var tmp = SubjectTable().Subject_list;
    List<Subject> subjects = [];
    for (var index in widget.ChoosedSubjects.keys) {
      generateColorCoat(tmp[index]);
      subjects.add(tmp[index]);
    }
    print(widget.ChoosedSubjects);
    return Scaffold(
      appBar: AppBar(
        title: Text("اختر جدول"),
        elevation: 2,
        surfaceTintColor: Colors.grey,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(child: LazyLoaderListView(children: subjects)),
          ColorSceamContainer(subjects_list: subjects),
        ],
      ),
    );
  }
}
