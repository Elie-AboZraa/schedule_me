import 'package:flutter/material.dart';

class StikyInfo extends StatelessWidget {
  const StikyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 249, 249, 249),
        boxShadow: [BoxShadow(blurRadius: 5,color: Colors.grey)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              Text(115641.toString()),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
