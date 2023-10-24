import 'package:elearning_angga/service/auth_service/auth_service.dart';
import 'package:elearning_angga/state_util.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLogout() async {
    await AuthService().logout();
    Get.offAll(const LoginView());
  }
}
