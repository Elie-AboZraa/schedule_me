import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 174, 18, 255)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        children: [Icon(Icons.login,color: Colors.white,), Text("تسجيل الدخول",style: Theme.of(context).textTheme.titleSmall?.apply(color:Colors.white),)],
      ),
    );
  }
}
