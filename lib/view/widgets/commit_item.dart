import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CommitItem extends StatelessWidget {
  CommitItem({
    super.key,
    required this.commitItem,
  });
  Map<String, dynamic> commitItem;

  String formatCommitDate(String commitedDate) {
    DateTime dateTime = DateTime.parse(commitedDate);
    DateTime now = DateTime.now();

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      DateFormat formatter = DateFormat("H:mm a");
      return formatter.format(dateTime);
    } else {
      DateFormat formatter = DateFormat(
        "EEEE,H:mm a",
      );
      return formatter.format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    String commitDate = commitItem["commit"]["author"]["date"];
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      padding: const EdgeInsets.only(
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(
              0.2,
            ),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          commitItem["commit"]["message"],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10.0,
                backgroundImage: NetworkImage(
                  commitItem["author"]["avatar_url"],
                ),
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(
                commitItem["commit"]["author"]["name"],
              ),
            ],
          ),
        ),
        trailing: Text(
          formatCommitDate(commitDate),
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}