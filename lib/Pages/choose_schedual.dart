import 'package:flutter/material.dart';
import 'package:schedule_me/Pages/lazyLoader.dart';
import 'package:schedule_me/Widgets/ColorSceamContainer.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// to make a dynamic show , we need to make it to calculate the scheduals as needed by calculating four scheduals at a time
class ChooseSchedual extends StatefulWidget {
  const ChooseSchedual({super.key});

  @override
  State<ChooseSchedual> createState() => _ChooseSchedualState();
}

class _ChooseSchedualState extends State<ChooseSchedual> {
  
  
  
  
  @override
  Widget build(BuildContext context) {
    //return MyApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("اختر جدول"),
        elevation: 2,
        surfaceTintColor: Colors.grey,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          ColorSceamContainer(subjects_list: []),
          ContainerBox(child: MyApp()),
          if (false)
      						Center(
      							child: Padding(
      								padding: const EdgeInsets.symmetric(vertical: 8),
      								child: CircularProgressIndicator(
      									color: Colors.green.shade900,
      								),
      							),
      						),
        ],
      ),
    );
  }
}
