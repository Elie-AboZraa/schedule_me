import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Class/SubjectTable.dart';
import 'package:schedule_me/Helpers/_CreateSchedualsFromCSV.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/FilterContainer.dart';
import 'package:schedule_me/Widgets/SubjectTableGridView.dart';

class ChoosingSubject extends StatefulWidget {
  //to-do change the name to file
  final dynamic fetchedSchedules;

  const ChoosingSubject({this.fetchedSchedules, super.key});
  @override
  State<ChoosingSubject> createState() => _ChoosingSubjectState();
}

var x = 0;

class _ChoosingSubjectState extends State<ChoosingSubject> {
  var icon = Icons.heart_broken;
  List<Subject> subjectlist = [];
  void sosoalraksa(Map map) {
    print(map.keys.toString() + "soso");
  }

  Timer? _debounceTimer;
  String searchQuery = "";
  Map<int, bool> chosenScheduals = {};
  final TextEditingController _searchController = TextEditingController();

  void setupSearchListener() {
    _searchController.addListener(() {
      if (_debounceTimer?.isActive ?? false) {
        _debounceTimer?.cancel();
      }

      _debounceTimer = Timer(Duration(milliseconds: 500), () {
        searchQuery = _searchController.text;
        print("searching");
        searchTheSubjectTable(_searchController.text);
      });
    });
  }

  List<Subject> searchedList = [];
  void searchTheSubjectTable(String text) {
    searchedList.clear();
    for (var i = 0; i < subjectlist.length; i++) {
      if (subjectlist[i].name!.toLowerCase().contains(text.toLowerCase())) {
        searchedList.add(subjectlist[i]);
      }
    }
    setState(() {});
    print(searchedList);
  }

  @override
  void initState() {
    super.initState();
    if (widget.fetchedSchedules is File) {
      Set_SubjectTable_LectureTable_From_CSV(widget.fetchedSchedules);
      subjectlist = SubjectTable().Subject_list;
    } else {
      subjectlist = [];
    }
    setupSearchListener();
    searchTheSubjectTable("");
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    ContainerBox(
                      title: "فلاتر",
                      // child: Container(),
                      child: FilterContainer(
                        onDropdownMenuStateChange: sosoalraksa,

                        searchFiealdControllar: _searchController,
                      ),
                    ),
                    ContainerBox(
                      title: "اختر المواد التي تريد دراستها",
                      child: SubjectTableGridView(
                        fetchedSubjects: searchedList,
                        chosenScheduals: chosenScheduals,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          StickyBottomContainer(context, chosenScheduals),
        ],
      ),
    );
  }
}

Container StickyBottomContainer(
  BuildContext context,
  Map<int, bool> chosenScheduals,
) {
  return Container(
    color: const Color.fromARGB(193, 255, 255, 255),
    child: ContainerBox(
      child: ButtonWithTextandIcon(
        text: "جدول",
        function: () => Navigator.of(
          context,
        ).push(createRoute(selection: "ChooseSchedule", data: chosenScheduals)),
        textstyle: Theme.of(
          context,
        ).textTheme.headlineMedium?.apply(color: Colors.white),
      ),
    ),
  );
}
