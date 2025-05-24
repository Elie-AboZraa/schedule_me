import 'package:flutter/material.dart';
import 'package:schedule_me/Router.dart';

class ButtonWithTextandIcon extends StatelessWidget {
  final String text;

  final IconData? icon;

  final String route;

  final VoidCallback? function;

  final TextStyle? textstyle;
  
  final ButtonStyle? buttonStyle;
  
  final dynamic PassedData;

  const ButtonWithTextandIcon({
    this.text = "",
    this.textstyle,
    this.icon,
    this.route = "Login",
    this.PassedData,
    this.function,
    this.buttonStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: 
      buttonStyle==(null)?
      ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple)
      :buttonStyle,

      onPressed:
          function == (null)
              ? () => Navigator.of(context).push(createRoute(selection: route,data: PassedData))
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
