import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';

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
      case "Subject_Type":
        options = ["", "", ""];
      case "Subject_Type":
        options = [];
      case "Subject_Type":
        options = [];

      default:
    }
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 2, right: 2),
        child: Text(Title, textAlign: TextAlign.end),
      ),
      subtitle: Container(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 213, 255),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
            borderRadius: BorderRadius.circular(3),
          ),

          child: DropdownButton(
            underline: SizedBox(),
            isExpanded: true,
            items: makeEnteries(options),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: ElevatedButton(onPressed: _updateState, child: Text("data")),);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
        ),
        child: ListTile(
          //color: Colors.amber,
          title: Text("فلاتر", textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall?.apply(color: Colors.deepPurpleAccent),),
          minVerticalPadding: 0,

          subtitle: ListView(
            shrinkWrap: true,
            children: [
              Row(children: [
              ListTileWithSelection(Title: "asaنوع المقرر"),
              ListTileWithSelection(Title: "نوع المقرر"),
              ],),
              ListTileWithSelection(Title: "نوع المقرر"),
              _CheckBoxGroup(),
            ],
          ),
        ),
      ),
    );
  }

  Container _CheckBoxGroup() {
    return Container(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2,
                children: [
                  CheckboxListTile(title: Text("sakldnasd"),value: false, onChanged: (value) {}),
                  CheckboxListTile(title: Text("sosoalrakasa"),value: false, onChanged: (value) {}),
                  CheckboxListTile(title: Text("data"),value: false, onChanged: (value) {}),
                  CheckboxListTile(title: Text("data"),value: false, onChanged: (value) {}),
                ],
              ),
            );
  }
}
