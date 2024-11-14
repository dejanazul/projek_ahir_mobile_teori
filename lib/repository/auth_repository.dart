import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projek_ahir_mobile_teori/features/homepage/screen/homepage.dart';

class AuthRepository extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String username, String email, String password) async {
    try {
      isLoading.value = true;
      var res = await http.post(
          Uri.parse(
              "http://10.0.2.2/project_ahir_mobile_teori_2/insert_data.php"),
          body: {'username': username, 'email': email, 'password': password});
      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        //pindah halaman
        Get.offAll(() => const Homepage());
      } else {
        //snackbar error
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }
}
