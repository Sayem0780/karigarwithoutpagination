import 'package:dio/dio.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://api.github.com";
  }

  Dio get sendRequest => _dio;
}