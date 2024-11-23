import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class HomepageController extends GetxController {
  final AuthRepository authRepository = Get.find();
  Future<void> logout() async {
    await authRepository.logout();
  }
}
