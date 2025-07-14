import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ColorSceamContainer extends StatelessWidget {
  final List<Subject> subjects_list;

  const ColorSceamContainer({required this.subjects_list, super.key});

  @override
  Widget build(BuildContext context) {
    // if (this.subjects_list == null || this.subjects_list!.isEmpty) {
    //   //return Container(child: Text("you Dident choose any subject or Somthing Wrong Happened"),);
    // }
    return ContainerBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.end,
        //mainAxisAlignment: MainAxisAlignment.center,
        //textDirection: TextDirection.rtl,
        children: createColorSceam(context, subjects_list),
      ),
    );
  }

  createColorSceam(context, List<Subject> Subjects) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    List<Widget> ColorSceam = [];
    List<Widget> tmp = [];
    for (var i = 0; i < Subjects.length; i++) {
      if (i % 3 == 0) {
        ColorSceam.add(
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: tmp.toList(),
          ),
        );
        tmp.clear();
      }
      tmp.add(
        Row(
          spacing: 10,
          children: [
            //value1
            Text(Subjects[i].name!),
            Container(
              height: height * 0.07,
              child: SizedBox(width: width * 0.08, height: height * 0.08),
              decoration: BoxDecoration(
                //value1.color
                color: Subjects[i].color,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      );
    }
    if (tmp.isNotEmpty) {
      ColorSceam.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 6,
          children: tmp.toList(),
        ),
      );
    }
    return ColorSceam.reversed.toList();
  }
}
