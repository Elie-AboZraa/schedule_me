import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';
import 'package:schedule_me/Widgets/CheckBoxGroup.dart';
import 'package:schedule_me/Widgets/DropDownButtonWithTitle.dart';

class FilterContainer extends StatefulWidget {
  final VoidCallback onStateChanged;
  const FilterContainer({required this.onStateChanged, super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  void _updateState() {
    //logic shit
    widget.onStateChanged();
  }

  Widget ListTileWithSelection({Title = ""}) {
    var options = [];
    switch (Title) {
      case "نوع المقرر":
        options = ["اجباري تخصصي","اجباري كلية","اختياري تخصصي","اختياري كلية"];
      case "الترتيب حسب":
        options = ["اسم","عدد الساعات",];
      case "Subject_Type":
        options = [];

      default:
       // options = [];
    }
    return DropDownButtonWithTitle(enteries: makeEnteries(options), title: Title);
  }

  void _onStateChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: ElevatedButton(onPressed: _updateState, child: Text("data")),);
    return Column(
      children: [
        Row(
          children: [
            ListTileWithSelection(Title: "نوع المقرر"),
            ListTileWithSelection(Title: "الترتيب حسب"),
          ],
        ),
        Row(
          children: [
            CheckBoxGroup(onStateChanged: _onStateChanged),
            ListTileWithSelection(Title: ""),
          ],
        ),
      ],
    );
  }
}
