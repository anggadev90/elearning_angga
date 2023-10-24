import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:elearning_angga/core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "AKP",
              style: GoogleFonts.zillaSlab(
                fontSize: 64.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[300],
              ),
            )
                .animate()
                .moveY(
                  begin: -100,
                  duration: 800.ms,
                )
                .fadeIn(
                  duration: 800.ms,
                ),
            Text(
              "Akademi Prestasi",
              style: GoogleFonts.zillaSlab(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            )
                .animate()
                .moveY(
                  begin: -100,
                  duration: 800.ms,
                )
                .fadeIn(
                  duration: 800.ms,
                ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 42,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                icon: Icon(MdiIcons.google),
                label: const Text("Login by Google"),
                onPressed: () => controller.doGoogleLogin(),
              ),
            )
                .animate()
                .moveX(
                  begin: -100,
                  duration: 800.ms,
                )
                .fadeIn(
                  duration: 800.ms,
                ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 42,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                icon: Icon(MdiIcons.facebook),
                label: const Text("Login by Facebook"),
                onPressed: () => controller.doFacebookLogin(),
              ),
            )
                .animate()
                .moveX(
                  begin: 100,
                  duration: 800.ms,
                )
                .fadeIn(
                  duration: 800.ms,
                ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
