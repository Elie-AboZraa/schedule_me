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
  Color? containerColor = null;
  Color textColor = Colors.black;
  Color subtextColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    bool status = false;
    var subject = widget.SubjectObject;
    if (widget.passedList.containsKey(widget.SubjectObject.index)) {
      status = true;
      containerColor = const Color(0xFF5cb85c);
      textColor = Colors.white;
      subtextColor = Colors.white;
    } else {
      status = false;
      containerColor = null;
      textColor = Colors.black;
      subtextColor = Colors.grey;
    }
    return ContainerBox(
      boxColor: containerColor,
      //value 1
      title: subject.name,
      titletextstyle: Theme.of(
        context,
      ).textTheme.titleMedium?.apply(color: textColor),
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
              ).textTheme.labelSmall?.apply(color: subtextColor),
            ),

            //value 3
            Text(
              "${subject.hours} ساعات ",
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.apply(color: subtextColor),
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
                    containerColor = const Color(0xFF5cb85c);
                    textColor = Colors.white;
                    subtextColor = Colors.white;
                    widget.passedList[widget.SubjectObject.index!] = true;
                  } else {
                    containerColor = null;
                    textColor = Colors.black;
                    subtextColor = Colors.grey;
                    widget.passedList.remove(widget.SubjectObject.index);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
