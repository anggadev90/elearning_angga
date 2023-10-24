import 'package:carousel_slider/carousel_controller.dart';
import 'package:elearning_angga/service/course_service/course_service.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

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

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  List courseList = [];
  getCourses() async {
    courseList = await CourseService().getCourses();
    setState(() {});
  }
}
