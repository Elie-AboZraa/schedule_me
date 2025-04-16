import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  // Required parameters
  final List<Widget> children;
  final int crossAxisCount;

  // Optional parameters for spacing
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const CustomGridView({
    Key? key,
    required this.children,
    required this.crossAxisCount,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildGridRows(),
      ),
    );
  }

  // Function to build rows for the grid
  List<Widget> _buildGridRows() {
    List<Widget> rows = [];
    for (int i = 0; i < children.length; i += crossAxisCount) {
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: mainAxisSpacing),
          child: Row(
            children: _buildGridItemsForRow(i),
          ),
        ),
      );
    }
    return rows;
  }

  // Function to build items for a single row
  List<Widget> _buildGridItemsForRow(int startIndex) {
    List<Widget> rowItems = [];
    for (int j = 0; j < crossAxisCount; j++) {
      int index = startIndex + j;
      if (index < children.length) {
        rowItems.add(
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: j < crossAxisCount - 1 ? crossAxisSpacing : 0),
              child: children[index],
            ),
          ),
        );
      } else {
        // Add an empty space if there are no more items
        rowItems.add(const Expanded(child: SizedBox()));
      }
    }
    return rowItems;
  }
}