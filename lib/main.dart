import 'package:elearning_angga/core.dart';
import 'package:elearning_angga/firebase_options.dart';
import 'package:elearning_angga/shared/theme/theme_config.dart';
import 'package:elearning_angga/state_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: getDefaultTheme(),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MainNavigationView() : const LoginView(),
    );
  }
}
