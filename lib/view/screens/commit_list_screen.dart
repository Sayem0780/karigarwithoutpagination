import 'package:flutter/material.dart';

import '../../controllers/repo/commit.dart';
import '../widgets/commit_list.dart';

class CommitListScreen extends StatefulWidget {
  const CommitListScreen({super.key});

  @override
  State<CommitListScreen> createState() => _CommitListScreenState();
}

class _CommitListScreenState extends State<CommitListScreen> {
  Commit commit = Commit();
  List<dynamic> commitList = [];
  bool isLoading = false;
  String errorTextContainer = "";

  void fetchAllCommit() {
    setState(() {
      isLoading = true;
    });
    commit.fetchCommits().then((value) {
      setState(() {
        commitList = value;
        isLoading = false;
      });
    }).catchError((err) {
      setState(() {
        isLoading = false;
        errorTextContainer = "Something went wrong!\n please try again later";
      });
    });
  }

  @override
  void initState() {
    fetchAllCommit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Flutter Commit List"),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: const Text(
                "master",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: (!isLoading && errorTextContainer.isEmpty)
          ? CommitList(commitList: commitList)
          : isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorTextContainer,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                fetchAllCommit();
              },
              child: const Text(
                "Reload",
              ),
            ),
          ],
        ),
      ),
    );
  }
}