import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ContainerTitleSubtitleButton extends StatefulWidget {
  final Subject SubjectObject;
  final Map<int, bool> passedList;
  const ContainerTitleSubtitleButton({
    required this.SubjectObject,
    required this.passedList,
    super.key,
  });

  @override
  State<ContainerTitleSubtitleButton> createState() =>
      _ContainerTitleSubtitleButtonState();
}

class _ContainerTitleSubtitleButtonState
    extends State<ContainerTitleSubtitleButton> {
  @override
  Widget build(BuildContext context) {
    bool status = false;
    var subject = widget.SubjectObject;
    if (widget.passedList.containsKey(widget.SubjectObject.index)) {
      status = true;
    } else {
      status = false;
    }
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
            TextButton.icon(
              label: Text("دراسة", style: TextStyle(color: Colors.white)),
              icon: status
                  ? Icon(Icons.favorite, color: Colors.white)
                  : Icon(Icons.favorite_border, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                setState(() {
                  status = !status;
                  if (status) {
                    widget.passedList[widget.SubjectObject.index!] = true;
                  } else {
                    widget.passedList.remove(widget.SubjectObject.index);
                  }
                });
              },
            ),
            // ElevatedButton(
            //   //value 4
            //   onPressed: () {
            //     icon = Icons.abc;
            //     widget.passedList[widget.subjectIndex] = true;
            //     icon = Icons.heart_broken;
            //     if (status == false) {
            //       status = true;
            //     } else {
            //       status = false;
            //       widget.passedList.remove([widget.subjectIndex]);
            //     }
            //     setState(() {
            //       status = !status;
            //     });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.deepPurple,
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     spacing: 6,
            //     children: [
            //       Icon(icon, color: Colors.white),
            //       Text("دراسة", style: TextStyle(color: Colors.white)),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
