import 'package:flutter/material.dart';

class ContainerBox extends StatefulWidget {
  final String? title;

  final Widget child;
  final TextStyle? titletextstyle;
  final Color? boxColor;
  final Widget? more_option_button;
  final Function(bool)? saveFunction;
  final bool? savestate;
  const ContainerBox({
    this.title = null,
    required this.child,
    this.boxColor,
    this.titletextstyle,
    this.more_option_button,
    this.saveFunction,
    this.savestate,
    super.key,
  });

  @override
  State<ContainerBox> createState() => _ContainerBoxState();
}

class _ContainerBoxState extends State<ContainerBox> {
  bool state = false;
  @override
  void initState() {
    super.initState();
    state = widget.savestate != null ? widget.savestate! : false;
  }

  @override
  Widget build(BuildContext context) {
    var windosize = MediaQuery.of(context).size;
    var windosize_mediam = windosize.width > (600);
    var titletextstyle = Theme.of(
      context,
    ).textTheme.headlineSmall?.apply(color: Colors.deepPurpleAccent);
    if (widget.titletextstyle != null) {
      titletextstyle = widget.titletextstyle!;
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        child: Container(
          padding: EdgeInsets.only(bottom: 10, top: 6),
          width: windosize_mediam ? windosize.width * 0.8 : double.infinity,
          decoration: BoxDecoration(
            color: widget.boxColor ?? Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: widget.boxColor == null
                    ? Colors.grey
                    : Colors.green.shade800,
                blurRadius: 12,
              ),
            ],
          ),

          //here is the main logic
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              //dealing with the conflict that if the title and the more option exsist thene they should be in a row  and have aligned space betwean
              //else if only the title exsist then the text should be in the center
              if (widget.title != null &&
                  (widget.more_option_button != null ||
                      widget.saveFunction != null))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.saveFunction == null
                        ? SizedBox()
                        : IconButton.filled(
                            onPressed: saveLogic,
                            icon: state
                                ? Icon(Icons.bookmark_add_rounded)
                                : Icon(Icons.bookmark_add_outlined),
                          ),
                    Expanded(
                      child: Text(
                        widget.title!,
                        textAlign: TextAlign.center,
                        style: titletextstyle,
                      ),
                    ),
                    ?widget.more_option_button,
                  ],
                )
              else if (widget.title != null)
                Text(
                  widget.title!,
                  textAlign: TextAlign.center,
                  style: titletextstyle,
                ),
              widget.child,
              Row(),
            ],
          ),
        ),
      ),
    );
  }

  void saveLogic() {
    setState(() {
      state = !state;
      if (state) {
        widget.saveFunction!(true);
      } else {
        widget.saveFunction!(false);
      }
    });
  }
}
