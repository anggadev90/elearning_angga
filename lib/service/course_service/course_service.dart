import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseService {
  Future<List> getCourses() async {
    var response = await Dio().get(
      "https://gist.githubusercontent.com/anggadev90/7389369e0007b94e94d4cd9500c9b19c/raw/elearning-api.json",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = jsonDecode(response.data);
    return obj["data"];
  }
}
