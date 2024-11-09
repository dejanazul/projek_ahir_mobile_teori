import 'package:get/get.dart';

class AuthRepository extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String username, String email, String password) async {
    try {
      isLoading.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
