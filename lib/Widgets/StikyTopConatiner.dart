import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class Stikytopconatiner extends StatelessWidget {
  const Stikytopconatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.black),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
