import 'package:elearning_angga/service/course_service/course_service.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import '../view/course_list_view.dart';

class CourseListController extends State<CourseListView> {
  static late CourseListController instance;
  late CourseListView view;

  @override
  void initState() {
    instance = this;
    getCourses();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List courseList = [];
  getCourses() async {
    courseList = await CourseService().getCourses();
    setState(() {});
  }

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }
}
