import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';
import 'package:schedule_me/Widgets/ScedualCalendar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
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
          return SchedualSkelton(index + 1);
        },
      ),
    );
  }
}

class SchedualSkelton extends StatelessWidget {
  final int index;

  const SchedualSkelton(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      title: " $index الجدول",
      more_option_button: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert_outlined),
      ),
      titletextstyle: Theme.of(
        context,
      ).textTheme.headlineSmall?.apply(color: Colors.black),
      child: ScedualCalendar(),
    );
  }
}
