import 'package:flutter/material.dart';

class DropDownButtonWithTitle extends StatefulWidget {
  final List<DropdownMenuItem> enteries;
  final String title;
   bool? shrinkWrap;

  TextStyle? textstyle;

  var widthfactor;

  var heightfactor;
  var ID;
  // a function to send the data for the parent widget ON CHANGE IN VALUES
  Function? sharedDataFunction;


  DropDownButtonWithTitle({
    super.key,
    required this.title,
    required this.enteries,
    required this.sharedDataFunction,
    required this.ID,

    this.shrinkWrap,
    this.textstyle,
    this.widthfactor,
    this.heightfactor,
  });

  @override
  State<DropDownButtonWithTitle> createState() =>
      _DropDownButtonWithTitleState();
}

class _DropDownButtonWithTitleState extends State<DropDownButtonWithTitle> {
  var selcted_value;
  SendDataToParent() async {
    if (widget.sharedDataFunction != null) {
      //await Future.delayed(Duration(seconds: 3));
      widget.sharedDataFunction!({
        widget.ID.toString(): selcted_value.toString(),
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selcted_value = widget.enteries[0].value;
     WidgetsBinding.instance.addPostFrameCallback((_) {
      // This runs once after the first frame is rendered
      SendDataToParent();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shrinkWrap == null ||
        widget.shrinkWrap == false ||
        (widget.widthfactor != null && widget.heightfactor != null)) {
      return BuildWithOutShrinkWraper(
        context,
        title: widget.title,
        textstyle: widget.textstyle,
        enteries: widget.enteries,
      );
    } else {
      return BuildWithShrinkWraper(
        context,
        title: widget.title,
        textstyle: widget.textstyle,
        enteries: widget.enteries,
        widthfactor: widget.widthfactor,
        heightfactor: widget.heightfactor,
      );
    }
  }

  Widget BuildWithOutShrinkWraper(
    BuildContext context, {
    String? title,
    TextStyle? textstyle,
    List<DropdownMenuItem>? enteries,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 9.0, left: 9.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title == null ? " " : title, textAlign: TextAlign.start),
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

                  items: enteries,
                  value: selcted_value.toString(),
                  onChanged: (_value) {
                    setState(() {
                      selcted_value = _value;
                    });
                    SendDataToParent();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildWithShrinkWraper(
    BuildContext context, {
    String? title,
    TextStyle? textstyle,
    List<DropdownMenuItem>? enteries,
    widthfactor,
    heightfactor,
  }) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title == null ? "" : title,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
          style: textstyle,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 213, 255),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
            borderRadius: BorderRadius.circular(3),
          ),
          constraints: BoxConstraints(
            maxHeight: (heightfactor != null)
                ? MediaQuery.of(context).size.height * heightfactor
                : MediaQuery.of(context).size.height * 0.04,
            maxWidth: (widthfactor != null)
                ? MediaQuery.of(context).size.width * widthfactor
                : MediaQuery.of(context).size.width,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownButton(
              underline: SizedBox(),
              isExpanded: true,
              dropdownColor: const Color.fromARGB(255, 247, 235, 255),

              elevation: 10,
              items: enteries,
              value: selcted_value.toString(),
              onChanged: (_value) {
                setState(() {
                  selcted_value = _value;
                });
                SendDataToParent();
              },
            ),
          ),
        ),
      ],
    );
  }
}
