import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Badge(
              label: const Center(
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              child: Icon(
                MdiIcons.chat,
                color: primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Badge(
              label: const Center(
                child: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              child: Icon(
                Icons.notifications,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey[900],
                  ),
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.sort,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                ),
              ),
            ).animate().move().fadeIn(),
            const SizedBox(
              height: 12.0,
            ),
            /*
            TODO: Implement this @ controller
            int currentIndex = 0;
            final CarouselController carouselController = CarouselController();
            */
            Builder(builder: (context) {
              List images = [
                "https://images.unsplash.com/photo-1568585219057-9206080e6c74?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1516534775068-ba3e7458af70?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1516321497487-e288fb19713f?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1588912914078-2fe5224fd8b8?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://images.unsplash.com/photo-1518818608552-195ed130cdf4?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ];

              return Column(
                children: [
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    options: CarouselOptions(
                      height: 160.0,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 1.2,
                      onPageChanged: (index, reason) {
                        controller.currentIndex = index;
                        controller.setState(() {});
                      },
                    ),
                    items: images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ).animate().move().fadeIn(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.asMap().entries.map((entry) {
                      bool isSelected = controller.currentIndex == entry.key;
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: isSelected ? 40 : 6.0,
                          height: 6.0,
                          margin: const EdgeInsets.only(
                            right: 6.0,
                            top: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? primaryColor
                                : const Color(0xff3c3e40),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                      ).animate().move().fadeIn();
                    }).toList(),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            Builder(builder: (context) {
              List items = ["All course", "Popular", "Newest"];
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
              );
            }).animate().moveX().fadeIn(),
            const SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              shrinkWrap: true,
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
                ).animate().move().fadeIn();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
