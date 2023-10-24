import 'package:elearning_angga/service/auth_service/auth_service.dart';
import 'package:elearning_angga/state_util.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doGoogleLogin() async {
    bool isLoggedIn = await AuthService().loginByGoogle();
    print("isLoggedIn: $isLoggedIn");
    if (isLoggedIn) {
      Get.offAll(const MainNavigationView());
    }
  }

  doFacebookLogin() async {
    bool isLoggedIn = await AuthService().loginByGoogle();
    if (isLoggedIn) {
      Get.offAll(const MainNavigationView());
    }
  }
}
