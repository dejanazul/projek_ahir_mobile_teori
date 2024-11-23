import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projek_ahir_mobile_teori/landing.dart';
import 'package:projek_ahir_mobile_teori/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      //loading
      isLoading.value = true;

      const uri = 'http://10.0.2.2/project_ahir_mobile_teori_2/check_data.php';
      var res = await http
          .post(Uri.parse(uri), body: {'email': email, 'password': password});
      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setBool('isLogin', true);
        await sharedPreferences.setString('currentUser', response['email']);

        Get.offAll(() => MainNavigation(email: response['email']));
      } else {
        Get.snackbar('Error', response['error'],
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
            colorText: Colors.white);
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(
      String username, String email, String password, String iv) async {
    try {
      //loading
      isLoading.value = true;

      const uri = 'http://10.0.2.2/project_ahir_mobile_teori_2/insert_data.php';
      var res = await http.post(Uri.parse(uri), body: {
        'username': username,
        'email': email,
        'password': password,
        'iv': iv
      });
      var response = jsonDecode(res.body);

      if (response['success'] == 'true') {
        //session
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setBool('isLogin', true);
        await sharedPreferences.setString('currentUser', response['email']);

        //pindah halaman
        Get.offAll(() => MainNavigation(email: response['email']));
      } else {
        Get.snackbar(
          'Error',
          response['error'],
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
          colorText: Colors.white,
        );
        //snackbar error
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('isLogin');
    sharedPreferences.remove('currentUser');

    Get.offAll(() => const LandingPage());
  }
}
