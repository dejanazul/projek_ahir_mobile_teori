import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  void login(String email, String password) {
    authRepository.login(email, password);
  }
}
