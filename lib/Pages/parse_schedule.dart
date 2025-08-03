import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/CacheDir.dart';
import 'package:schedule_me/Helpers/_AutoFetchFile.dart';
import 'package:schedule_me/Helpers/_ListViewFromFiles.dart';
import 'package:schedule_me/Helpers/_FilePicker.dart';
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
  updateUI() async {
    setState(() {});
    /*await Fluttertoast.showToast(
      msg: 'GeeksforGeeks', // Message to display in the toast
      backgroundColor: Colors.grey, // Background color of the toast
    );*/
  }

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
                child: Wrap(
                  spacing: 10,

                  children: [
                    ButtonWithTextandIcon(
                      //To-Do change the Text here
                      text: " من ملف موفر ",
                      icon: Icons.add,
                      function: () async {
                        var tmp = await pickafile();
                        if (tmp != null) {
                          CacheDir().saveCSVFile(tmp);
                          Navigator.of(context).push(
                            createRoute(
                              selection: "CreateSchedules",
                              data: tmp,
                            ),
                          );
                        }
                      },

                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 94, 66),
                      ),
                    ),
                    ButtonWithTextandIcon(
                      text: " تنزيل تلقائي ",
                      icon: Icons.add,
                      // function: _isLoading ? autoFetchFile : autoFetchFile,
                      function: () {
                        if (!_isLoading) {
                          autoFetchFile(this.updateUI);
                        }
                      },
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 94, 66),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: CacheDir().getCacheFiles(
                subDirectory: "/UserDatabase",
                fileExtention: ".csv",
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
                      updateUI,
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
