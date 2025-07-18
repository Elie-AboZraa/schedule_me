import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:schedule_me/Class/Subject.dart';
import 'package:schedule_me/Class/ScheduleGenerator.dart';
import 'package:schedule_me/Widgets/SchedualSkelton.dart';

class LazyLoaderListView extends StatefulWidget {
  final List<Subject> children;
  LazyLoaderListView({required this.children, super.key});

  @override
  _LazyLoaderListViewState createState() => _LazyLoaderListViewState();
}

class _LazyLoaderListViewState extends State<LazyLoaderListView> {
  List<dynamic> data = [];
  int currentLength = 0;

  final int increment = 3;
  bool isLoading = false;
  ScheduleGenerator? generator;
  bool done = false;
  @override
  void initState() {
    generator = ScheduleGenerator(selectedSubjects: widget.children);
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    if (done) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    for (var i = 0; i < increment; i++) {
      if (generator!.generateNextSchedual() != null) {
        data.add(generator!.deepCloneWithLectureCopy());
      } else {
        data.add(null);
        done = true;
        break;
      }
    }
    // preventing an error dou to the parent get disposed and after the timer end the setstat function for the parent get called
    if (this.mounted) {
      setState(() {
        isLoading = false;
        currentLength = data.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      isLoading: isLoading,
      scrollOffset: 100,
      onEndOfPage: () => _loadMore(),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data[index] == null) {
            return SchedualSkelton(null, index.toString() + "الجدول");
          }
          return SchedualSkelton(data[index], "${index + 1}الجدول");
        },
      ),
    );
  }
}
