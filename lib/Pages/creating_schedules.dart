import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/FilterContainer.dart';

class CreatingSchedulesPage extends StatefulWidget {
  const CreatingSchedulesPage({super.key});

  @override
  State<CreatingSchedulesPage> createState() => _CreatingSchedulesPageState();
}

var x = 0;

class _CreatingSchedulesPageState extends State<CreatingSchedulesPage> {
  void _onStateChanged() {
    setState(() {
      x++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("جداول جديدة"),shadowColor: Colors.grey,),
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: FilterContainer(onStateChanged: _onStateChanged)),
    );
  }
}
