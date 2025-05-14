import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ColorSceamContainer extends StatelessWidget {
  final List? subjects_list;

  const ColorSceamContainer({List? this.subjects_list, super.key});

  @override
  Widget build(BuildContext context) {
    if (this.subjects_list == null || this.subjects_list!.isEmpty) {
      //return Container(child: Text("you Dident choose any subject or Somthing Wrong Happened"),);
    }
    var Subjects = [
      "soso al rakasa",
      "software2",
      "itw",
      "soso al rakasa",
      "software2",
      "itw",
      "itw",
      "soso al rakasa",
      "software2",
      "itw"," bvg",
    ];
    return ContainerBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 10,right: 20),
        reverse: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          //mainAxisAlignment: MainAxisAlignment.center,
          //textDirection: TextDirection.rtl,
          children: createColorSceam(context, Subjects),
        ),
      ),
    );
  }

  createColorSceam(context, Subjects) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    List<Widget> ColorSceam = [];
    List<Widget> tmp = [];
    for (var i = 0; i < Subjects.length; i++) {
      if (i % 3 == 0) {
        ColorSceam.add(
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: tmp.toList(),
          ),
        );
        tmp.clear();
      }
      tmp.add(
        Row(
          
          spacing: 10,
          children: [
            Text(Subjects[i]),
            Container(
              height: height * 0.07,
              child: SizedBox(width: width * 0.08, height: height * 0.08),
              decoration: BoxDecoration(
                color: Colors.red,
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
