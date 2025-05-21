import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_ListViewFromFiles.dart';
import 'package:schedule_me/Helpers/_FilePicker.dart';
import 'package:schedule_me/Helpers/getCacheFiles.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ParsingSchedualFromFile extends StatelessWidget {
  const ParsingSchedualFromFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جدول جديدة"),
        elevation: 2,
        surfaceTintColor: Colors.grey,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          ContainerBox(
            child: ButtonWithTextandIcon(
              //To-Do change the Text here 
              text: "اضف الملف الموفر من الموقع",
              icon: Icons.add,
              function: FilePicker,
              buttonStyle: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 94, 66)),
            ),
          ),
           FutureBuilder(
      future: getCacheFiles(subDirectory: "/Downloaded-Schedules",fileExtention: ".xlsx"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          return Column(
            children: ListViewFromFiles(context,snapshot.data as List<File>,"لا يوجد ملفات محفوظة "),
          );
        }
        return Text("ss");
      },
    )
        ],
      ),
    );
  }
}
