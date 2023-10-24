import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controller/course_list_controller.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({Key? key}) : super(key: key);

  Widget build(context, CourseListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Course List"),
        actions: const [],
      ),
      body: Column(
        children: [
          Builder(builder: (context) {
            List items = ["All course", "On progress", "Completed"];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: List.generate(items.length, (index) {
                  var item = items[index];
                  bool selected = controller.selectedIndex == index;
                  return Expanded(
                    child: InkWell(
                      onTap: () => controller.updateIndex(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 8.0,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          color: selected ? primaryColor : Colors.grey[400],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "$item",
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ).animate().moveX().fadeIn();
          }),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: controller.courseList.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.courseList[index];
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 11),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 54.0,
                        width: 54.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              item["photo"],
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["course_name"],
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${item["lesson_count"]} Lessons",
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      SizedBox(
                        width: 42.0,
                        height: 42.0,
                        child: Stack(
                          children: [
                            CircularProgressIndicator(
                              value: item["progress"],
                              backgroundColor: Colors.grey[300],
                              color: primaryColor,
                            ),
                            Positioned(
                              left: 10,
                              top: 12,
                              child: Text(
                                "${(item["progress"] * 100).floor()}%",
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ).animate().moveX().fadeIn(),
        ],
      ),
    );
  }

  @override
  State<CourseListView> createState() => CourseListController();
}
