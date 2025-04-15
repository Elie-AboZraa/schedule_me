import 'package:flutter/material.dart';
import 'package:schedule_me/Router.dart';

class ButtonWithTextandIcon extends StatelessWidget {
  final String text;

  final dynamic icon;

  final String route;

  const ButtonWithTextandIcon({this.text="", this.icon, this.route="Home", super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: ()=>Navigator.of(context).push(createRoute(this.route)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 3,
        children: [
          Icon(
            this.icon,
            color: Colors.white,
            size: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
          Text(
            this.text,
            style: Theme.of(context).textTheme.titleMedium?.apply(
              color: Colors.white,
              //fontWeightDelta: 1,
            ),
          ),
        ],
      ),
    );
  }
}
