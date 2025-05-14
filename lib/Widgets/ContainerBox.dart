import 'package:flutter/material.dart';

class ContainerBox extends StatefulWidget {
  final String? title;

  final Widget child;
  final TextStyle? titletextstyle;

  final Widget? more_option_button;

  const ContainerBox({
    this.title = null,
    required this.child,
    this.titletextstyle,
    this.more_option_button,
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

          //here is the main logic
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              //dealing with the conflict that if the title and the more option exsist thene they should be in a row  and have aligned space betwean 
              //else if only the title exsist then the text should be in the center 
              if (widget.title!=null&&widget.more_option_button!=null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                            widget.title!,
                            textAlign: TextAlign.center,
                            style: titletextstyle,
                          ),
                          ?widget.more_option_button
                      ],
                    )
                    else if(widget.title!=null)
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
