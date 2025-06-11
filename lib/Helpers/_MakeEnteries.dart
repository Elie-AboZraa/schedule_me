import 'package:flutter/material.dart';

List<DropdownMenuItem> makeEnteries(List enteries, {List? valus,TextStyle? textStyle}) {
  List<DropdownMenuItem> list = [];
  if (valus==null) {
    valus=enteries.toList();
  }
  int counter=0;
  if (enteries.isNotEmpty) {
    // the most readable way to say if the text style is provided then putwt else dont 
    if (textStyle != null) {
      for (var element in enteries) {
        list.add(
          DropdownMenuItem(
            value: valus[counter].toString(),
            child: Text(" " + element + " ", style: textStyle),
          ),
        );
        counter++;
      }
    } else {
      for (var element in enteries) {
        list.add(
          DropdownMenuItem(
            value:  valus[counter].toString(),
            child: Text(" " + element + " "),
          ),
        );
        counter++;
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
