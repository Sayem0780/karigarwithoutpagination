import 'package:flutter/material.dart';

import './commit_item.dart';

// ignore: must_be_immutable
class CommitList extends StatelessWidget {
  CommitList({
    super.key,
    required this.commitList,
  });
  List<dynamic> commitList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commitList.length,
      itemBuilder: (context, index) {
        return CommitItem(
          commitItem: commitList[index],
        );
      },
    );
  }
}