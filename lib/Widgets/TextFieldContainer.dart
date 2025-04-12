import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({super.key, this.type});
  final type;
  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  var HidePassword = false;
  var TrailingIcon = Icons.person_outline;
  var LeadingIcon = null;
  String _checkType(type) {
    if (type == "password") {
      HidePassword = true;
      TrailingIcon = Icons.lock_outline;
      LeadingIcon = _visablePasswordIcon();
      return "كلمة المرور";
    }
    return "الرقم الجامعي";
  }

  @override
  Widget build(BuildContext context) {
    var title = _checkType(widget.type);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.apply(
                fontWeightDelta: 2,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 242, 242),
              border: Border.all(
                color: Color.fromARGB(255, 167, 167, 167),
                width: 2.3,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.fromLTRB(4, 0, 10, 0),
              titleAlignment: ListTileTitleAlignment.center,
              title: TextField(
                maxLines: 1,
                textDirection: TextDirection.rtl,
                obscureText: HidePassword,
                cursorHeight: 20,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              trailing: Icon(TrailingIcon,color: Color.fromARGB(255, 144, 144, 144),),
              leading: LeadingIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class _visablePasswordIcon extends StatelessWidget {
  const _visablePasswordIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 115, 100, 251)),
      icon: Icon(Icons.remove_red_eye_outlined, color: Colors.black87),
      onPressed: () {},
    );
  }
}
