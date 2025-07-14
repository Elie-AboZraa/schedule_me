import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/Container&Title&Subtitle&Button.dart';
import 'package:schedule_me/Widgets/CoustomeGridView.dart';

class SubjectTableGridView extends StatelessWidget {
  final Map<int, bool> chosenScheduals;
  final List fetchedSubjects;
  const SubjectTableGridView({
    required this.fetchedSubjects,
    required this.chosenScheduals,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    for (var i = 0; i < fetchedSubjects.length; i++) {
      widgetList.add(
        ContainerTitleSubtitleButton(
          SubjectObject: fetchedSubjects[i],
          passedList: chosenScheduals,
        ),
      );
    }

    var crossAxisCount = (MediaQuery.of(context).size.width / 400).round();
    return CustomGridView(crossAxisCount: crossAxisCount, children: widgetList);
  }
}
