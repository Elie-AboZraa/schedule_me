import 'package:flutter/material.dart';

class ContainerBox extends StatefulWidget {
  final String? title;

  final Widget child;
  final TextStyle? titletextstyle;

  const ContainerBox({
    this.title = null,
    required this.child,
    this.titletextstyle,
    super.key,
  });

  @override
  State<ContainerBox> createState() => _ContainerBoxState();
}

class _ContainerBoxState extends State<ContainerBox> {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
          ),
          child: Column(
            spacing: 10,
            children: [
              Row(),
              widget.title == (null)
                  ? Container()
                  : 
                  Text(
                    widget.title!,
                    textAlign: TextAlign.center,
                    style: titletextstyle,
                  ),

              widget.child,
              Row()
            ],
          ),
        ),
      ),
    );
  }
}
