import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_ahir_mobile_teori/auth/encrypt.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository = Get.find();
  final Encrypt encrypt = Get.put(Encrypt());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  Future<void> login(String email, String password) async {
    final encryptedPassword = await encrypt.loginEncryptData(email, password);
    authRepository.login(email, encryptedPassword ?? '');
  }
}
