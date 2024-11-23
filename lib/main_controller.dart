import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:projek_ahir_mobile_teori/auth/login/controller/login_controller.dart';
import 'package:projek_ahir_mobile_teori/landing.dart';
import 'package:projek_ahir_mobile_teori/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  @override
  Future<void> onReady() async {
    super.onReady();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final isLogin = sharedPreferences.getBool('isLogin');
    final currentUser = sharedPreferences.getString('currentUser');
    isLogin == true
        ? Get.offAll(() => MainNavigation(
              email: currentUser ?? 'Guest',
            ))
        : Get.offAll(() => const LandingPage());
  }
}
