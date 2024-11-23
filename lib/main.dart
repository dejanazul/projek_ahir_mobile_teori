import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:projek_ahir_mobile_teori/auth/encrypt.dart';
import 'package:projek_ahir_mobile_teori/auth/login/controller/login_controller.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/controller/signup_controller.dart';
import 'package:projek_ahir_mobile_teori/main_controller.dart';
import 'package:projek_ahir_mobile_teori/features/homepage/controller/homepage_controller.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';
import 'package:projek_ahir_mobile_teori/landing.dart';
import 'package:projek_ahir_mobile_teori/repository/notifications_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Hive.initFlutter();
  await Hive.openBox('purchasedTickets');
  Get.put(AuthRepository());
  Get.put(MainController());
  Get.put(Encrypt());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => HomepageController(), fenix: true);

    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: LandingPage());
  }
}
