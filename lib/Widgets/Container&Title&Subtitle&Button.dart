import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ContainerTitleSubtitleButton extends StatefulWidget {
  final Subject SubjectObject;
  final List passedList;
  const ContainerTitleSubtitleButton({
    required this.SubjectObject,
    required this.passedList,
    super.key,
  });

  @override
  State<ContainerTitleSubtitleButton> createState() =>
      _ContainerTitleSubtitleButtonState();
}

var icon = Icons.heart_broken;
bool status = false;

class _ContainerTitleSubtitleButtonState
    extends State<ContainerTitleSubtitleButton> {
  @override
  Widget build(BuildContext context) {
    var subject = widget.SubjectObject;
    return ContainerBox(
      //value 1
      title: subject.name,
      titletextstyle: Theme.of(
        context,
      ).textTheme.titleMedium?.apply(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.max,
          children: [
            //value 2
            Text(
              subject.type.toString(),
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.apply(color: Colors.grey),
            ),
            //value 3
            Text(
              "${subject.hours} ساعات ",
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.apply(color: Colors.grey),
            ),
            ElevatedButton(
              //value 4
              onPressed: () {
                setState(() {
                  if (status == false) {
                    status = true;
                    icon = Icons.abc;
                    widget.passedList.add(subject.name);
                  } else {
                    status = false;
                    icon = Icons.heart_broken;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 6,
                children: [
                  Icon(icon, color: Colors.white),
                  Text("دراسة", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
