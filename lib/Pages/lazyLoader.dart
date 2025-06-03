import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/ScedualCalendar.dart';
import 'package:schedule_me/Widgets/SchedualSkelton.dart';

class LazyLoaderListView extends StatefulWidget {
  LazyLoaderListView({super.key});

  @override
  _LazyLoaderListViewState createState() => _LazyLoaderListViewState();
}

class _LazyLoaderListViewState extends State<LazyLoaderListView> {
  List<int> data = [];
  int currentLength = 0;

  final int increment = 3;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    // Add a delay
    await Future.delayed(const Duration(seconds: 2));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
    }
    // preventing an error dou to the parent get disposed and after the timer end the setstat function for the parent get called
    if(this.mounted){

    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }
    }

  @override
  Widget build(BuildContext context) {
    return LazyLoaderScrollView(
      isLoading: isLoading,
      scrollOffset: 100,
      onEndOfPage: () => _loadMore(),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SchedualSkelton(index + 1);
        },
      ),
    );
  }
}
