import 'package:flutter/material.dart';

List<DropdownMenuItem> makeEnteries(List enteries, {TextStyle? textStyle}) {
  List<DropdownMenuItem> list = [];
  if (enteries.isNotEmpty) {
    // the most readable way to say if the text style is provided then putwt else dont 
    if (textStyle != null) {
      for (var element in enteries) {
        list.add(
          DropdownMenuItem(
            value: element.toString(),
            child: Text(" " + element + " ", style: textStyle),
          ),
        );
      }
    } else {
      for (var element in enteries) {
        list.add(
          DropdownMenuItem(
            value: element.toString(),
            child: Text(" " + element + " "),
          ),
        );
      }
    }

    return list;
  }
  return [
    DropdownMenuItem(
      value: "",
      child: Text("Error", style: TextStyle(color: Colors.red)),
    ),
  ];
}
