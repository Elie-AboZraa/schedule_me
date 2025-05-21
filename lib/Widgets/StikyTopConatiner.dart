import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ImageParser.dart';

class Stikytopconatiner extends StatelessWidget {
  final Map? clientInfo;
  const Stikytopconatiner({this.clientInfo,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
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
          Row(spacing: 10,
            children: [
              ImageNetworkParser(clientInfo: clientInfo,),
                Text(clientInfo!["data"]["USERNAME"].toString()),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
