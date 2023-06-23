import 'package:dio/dio.dart';

import '../api/api.dart';

class Commit {
  final API _api = API();

  Future<List<dynamic>> fetchCommits() async {
    Response<dynamic> response = await _api.sendRequest
        .get("/repos/flutter/flutter/commits?sha=master&per_page=5");

    List<dynamic> commits = response.data as List<dynamic>;
    return commits;
  }
}