import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({super.key, this.type});
  final type;
  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  String _checkType(type) {
    if (type == "password") {
      return "كلمة المرور";
    }
    return "الرقم الجامعي";
  }

  @override
  Widget build(BuildContext context) {
    var title = _checkType(widget.type);

    return Container(
      width: 500,
      child: ListTile(
        title: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.apply(
                fontWeightDelta: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
        subtitle: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              cursorHeight: 20,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        //trailing: Icon(Icons.add_ic_call_outlined),
      ),
    );
  }
}
