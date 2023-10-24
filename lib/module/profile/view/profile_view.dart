import 'package:elearning_angga/state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.settings,
                  size: 16.0,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28.0,
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ??
                          "https://i.ibb.co/S32HNjD/no-image.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${FirebaseAuth.instance.currentUser!.displayName}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "${FirebaseAuth.instance.currentUser!.email}",
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).animate().move().fadeIn(),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[200]!,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Builder(builder: (context) {
                      List items = [
                        {
                          "label": "Edit profile",
                          "page": Container(),
                        },
                        {
                          "label": "Change password",
                          "page": Container(),
                        },
                      ];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var item in items)
                            InkWell(
                              // onTap: () => Get.to(item["page"]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["label"],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 18.0,
                                      color: Colors.grey[800],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ).animate().move().fadeIn(),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[200]!,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Builder(builder: (context) {
                      List items = [
                        {
                          "label": "Privacy policy",
                          "page": Container(),
                        },
                        {
                          "label": "TOS",
                          "page": Container(),
                        },
                        {
                          "label": "FAQ",
                          "page": Container(),
                        },
                        {
                          "label": "Deactivate account",
                          "page": Container(),
                        }
                      ];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var item in items)
                            InkWell(
                              // onTap: () => Get.to(item["page"]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["label"],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      size: 18.0,
                                      color: Colors.grey[800],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ).animate().move().fadeIn(),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () => controller.doLogout(),
                  child: const Text("Logout"),
                ),
              ).animate().move().fadeIn(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
