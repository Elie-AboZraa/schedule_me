import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Helpers/_ListViewFromFiles.dart';
import 'package:schedule_me/Helpers/_FilePicker.dart';
import 'package:schedule_me/Helpers/getCacheFiles.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ParsingSchedualFromFile extends StatefulWidget {
  final dynamic PassedData;

  const ParsingSchedualFromFile({super.key, this.PassedData});

  @override
  State<ParsingSchedualFromFile> createState() =>
      _ParsingSchedualFromFileState();
}

class _ParsingSchedualFromFileState extends State<ParsingSchedualFromFile> {
  dynamic _result;
  // To store the result from the Future
  bool _isLoading = false;
  // Optional: Show loading indicator
  /*
  void _runFuture() async {
        setState(() {
      _isLoading = true;
    });
     _result = await GetLectureRequest(widget.PassedData); // Run the future

        setState(() {
      _isLoading = false;
    });
    if (_result["success"]==true){
      print(_result);
      var tmp=processRequestedData(_result);
     Navigator.of(context).push(createRoute(selection: "CreateSchedules",data: tmp));
    }

  }*/

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
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            ContainerBox(
              title: "اختر مصدر الجداول",
              titletextstyle: Theme.of(
                context,
              ).textTheme.titleLarge?.apply(color: Colors.black),

              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 10,
                  children: [
                    ButtonWithTextandIcon(
                      //To-Do change the Text here
                      text: " من ملف موفر ",
                      icon: Icons.add,
                      function: () async => Navigator.of(context).push(
                        createRoute(selection: "CreateSchedules", data: await pickafile()),
                      ),
                      //route: "creating_schedual",
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 94, 66),
                      ),
                    ),
                    ButtonWithTextandIcon(
                      //To-Do change the Text here
                      text: " من موقع الجامعة ",
                      icon: Icons.add,
                      function: _isLoading ? null : null,
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 94, 66),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: getCacheFiles(
                subDirectory: CacheDir().directory,
                fileExtention: ".xlsx",
              ),
              //To-Do convet this builder to a widget
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else if (snapshot.hasData) {
                  return Column(
                    children: ListViewFromFiles(
                      context,
                      snapshot.data as List<File>,
                      "لا يوجد ملفات محفوظة ",
                    ),
                  );
                }
                return Text("Big Error");
              },
            ),
          ],
        ),
      ),
    );
  }
}
