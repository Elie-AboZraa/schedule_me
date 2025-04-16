import 'package:flutter/material.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/Container&Title&Subtitle&Button.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/FilterContainer.dart';
import 'package:schedule_me/Widgets/CoustomeGridView.dart';

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

  var icon = Icons.heart_broken;

  Widget GetSubjects(List fetchedSubjects) {
    List<Widget> widget_list=[];
    for (var subjects in fetchedSubjects) {
      widget_list.add(ContainerTitleSubtitleButton());
    }
    var crossAxisCount=(MediaQuery.of(context).size.width/400).round();
    print(crossAxisCount);
    return CustomGridView(children: widget_list, crossAxisCount: crossAxisCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("جداول جديدة"), shadowColor: Colors.grey),
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
                      ).push(createRoute("CreateSchedules")),
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
