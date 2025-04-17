
import 'package:flutter/material.dart';

List<DropdownMenuItem> makeEnteries(List enteries){
List<DropdownMenuItem> list=[];
if (enteries.isNotEmpty){
for (var element in enteries) {
  list.add(DropdownMenuItem(value: element.toString(),child: Text(element),));
}
return list;
}
return [DropdownMenuItem(value: "",child: Text("data"))];
}