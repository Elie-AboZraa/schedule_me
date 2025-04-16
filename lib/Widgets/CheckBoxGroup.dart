import 'package:flutter/material.dart';

class CheckBoxGroup extends StatefulWidget {
  final VoidCallback onStateChanged;

  const CheckBoxGroup({
    required this.onStateChanged,
    super.key,
  });

  @override
  State<CheckBoxGroup> createState() => _CheckBoxGroupState();
}
var value=false;
class _CheckBoxGroupState extends State<CheckBoxGroup> {
  void _flipValue(x){
    setState(() {
      value=x;
    });
  }
  void _updateState() {
    //logic shit
    widget.onStateChanged();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(        
        children: [
          CheckboxListTile(
            title: Text("sakldnasd",textDirection: TextDirection.rtl,),
            selected: true,
            value: value,
            onChanged: (value)=>_flipValue(value),
          ),
          CheckboxListTile(
            title: Text("sosoalrakasa"),
            value: value,
            onChanged: (value)=>_flipValue(value),
          ),
          
         
        ],
      ),
    );
  }
}
