import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';


class SchedualSkelton extends StatelessWidget {
  final int index;

  const SchedualSkelton(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      title: " $index الجدول",
      more_option_button: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert_outlined),
      ),
      titletextstyle: Theme.of(
        context,
      ).textTheme.headlineSmall?.apply(color: Colors.black),
      //child: ScedualCalendar(),
      child: Text("hallo"),
    );
  }
}
