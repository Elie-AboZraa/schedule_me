import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ContainerTitleSubtitleButton extends StatefulWidget {
  final Subject SubjectObject;
  const ContainerTitleSubtitleButton({required this.SubjectObject, super.key});

  @override
  State<ContainerTitleSubtitleButton> createState() => _ContainerTitleSubtitleButtonState();
}
  var icon = Icons.heart_broken;
class _ContainerTitleSubtitleButtonState extends State<ContainerTitleSubtitleButton> {
  @override
  Widget build(BuildContext context) {
    var subject=widget.SubjectObject;
    return ContainerBox(
          //value 1
          //title: "تصميم مواقع الويب",
          title: subject.Name,
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
                  subject.Type,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.apply(color: Colors.grey),
                ),
                //value 3
                Text(
                  "${subject.Hours} ساعات ",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.apply(color: Colors.grey),
                ),
                ElevatedButton(
                  //value 4
                  onPressed: () {
                    setState(() {
                      if (icon == Icons.heart_broken) {
                        icon = Icons.abc;
                      } else {
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