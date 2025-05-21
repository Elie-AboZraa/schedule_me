import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Class/TimeOfLecture.dart';
import 'package:schedule_me/Helpers/_CreateSchedualsFromExcel.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/Container&Title&Subtitle&Button.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/FilterContainer.dart';
import 'package:schedule_me/Widgets/CoustomeGridView.dart';

class CreatingSchedulesPage extends StatefulWidget {  
  final File? fetchedFile;

  const CreatingSchedulesPage({this.fetchedFile,super.key});
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

  var icon = Icons.heart_broken;

  Widget GetSubjects(List fetchedSubjects) {
    List<Widget> widget_list=[];
    for (var subjects in fetchedSubjects) {
      widget_list.add(ContainerTitleSubtitleButton(SubjectObject: Subject(Name: subjects, Type: "تخصصية اجبارية", Hours: 2,Scedual_Data: new Map<Day,TimeOfLecture>()),));
    }
    var crossAxisCount=(MediaQuery.of(context).size.width/400).round();
    return CustomGridView(children: widget_list, crossAxisCount: crossAxisCount);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fetchedFile==null){
    CreateSchedualsFromExcel(widget.fetchedFile!,);
    }else{
      const Duration(seconds: 2);
          CreateSchedualsFromExcel(widget.fetchedFile!,);

    }
    return Scaffold(
      appBar: AppBar(title: Text("جدول جديدة"),elevation: 2,surfaceTintColor: Colors.grey,backgroundColor: Colors.white, shadowColor: Colors.black,),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Column(
            children: [
              ContainerBox(
                title: "فلاتر",
                // child: Container(),
                child: FilterContainer(onStateChanged: _onStateChanged),
              ),
              ContainerBox(
                title: "اختر المواد التي تريد دراستها",
                child: GetSubjects([
                  "soso al rakasa",
                  "software2",
                  "itw",
                  "soso al rakasa",
                  "software2",
                  "itw",
                ]),
              ),
              ContainerBox(
                child: ButtonWithTextandIcon(
                  text: "جدول",
                  function:
                      () => Navigator.of(
                        context,
                      ).push(createRoute(selection: "ChooseSchedule")),
                  textstyle: Theme.of(context).textTheme.headlineMedium?.apply(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
