import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:projek_ahir_mobile_teori/auth/login/controller/login_controller.dart';
import 'package:projek_ahir_mobile_teori/auth/login/screen/login_screen.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/controller/signup_controller.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';
import 'package:projek_ahir_mobile_teori/screen/landing.dart';

void main() {
  Get.put(AuthRepository());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);

    return const GetMaterialApp(home: LandingPage());
  }
}
