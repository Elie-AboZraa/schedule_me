import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';
import 'package:schedule_me/Widgets/CheckBoxGroup.dart';

class DropDownButtonWithTitle extends StatefulWidget {
  final List<DropdownMenuItem> enteries;
  final String title;
  DropDownButtonWithTitle({
    super.key,
    required this.title,
    required this.enteries,
  });

  @override
  State<DropDownButtonWithTitle> createState() =>
      _DropDownButtonWithTitleState();
}

class _DropDownButtonWithTitleState extends State<DropDownButtonWithTitle> {
  var soso;
  @override
  void initState() {
    super.initState();
    soso = widget.enteries[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 9.0, left: 9.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.title, textAlign: TextAlign.start),
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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  
                  items: widget.enteries,
                  value: soso.toString(),
                  onChanged: (_value) {
                    setState(() {
                      soso = _value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
