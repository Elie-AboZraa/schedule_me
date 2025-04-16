import 'package:flutter/material.dart';
import 'package:schedule_me/Router.dart';

class ButtonWithTextandIcon extends StatelessWidget {
  final String text;

  final dynamic icon;

  final String route;

  final VoidCallback? function;

  final TextStyle? textstyle;

  const ButtonWithTextandIcon({
    this.text = "",
    this.textstyle,
    this.icon,
    this.route = "Home",
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),

      onPressed:
          function == (null)
              ? () => Navigator.of(context).push(createRoute(route))
              : function,
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0,bottom: 3.0),
        child: Row(
          
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 3,
          children: [
            icon == (null)
                ? SizedBox()
                : Icon(
                  icon!,
                  color: Colors.white,
                  size: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
            Text(
              text,
        
              style:textstyle==(null)? Theme.of(context).textTheme.titleMedium?.apply(
                color: Colors.white,
                //fontWeightDelta: 1,
              ):textstyle!,
            ),
          ],
        ),
      ),
    );
  }
}
