import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';
import 'package:schedule_me/Widgets/CheckBoxGroup.dart';

var value = "";

class DropDownButtonWithTitle extends StatelessWidget {
  const DropDownButtonWithTitle({
    super.key,
    required this.title,
    required this.enteries,
  });

  final List enteries;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 9.0, left: 9.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, textAlign: TextAlign.start),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 213, 255),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                borderRadius: BorderRadius.circular(3),
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.04,
              ),
              //child: Text("asdla;md"),
              child: DropdownButton(
                underline: SizedBox(),
                isExpanded: true,
                items: makeEnteries(enteries),
                value: value,
                onChanged: (_value) {
                  value = _value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
