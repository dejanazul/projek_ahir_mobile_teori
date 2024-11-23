import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_ahir_mobile_teori/auth/encrypt.dart';
import 'package:projek_ahir_mobile_teori/repository/auth_repository.dart';

class SignupController extends GetxController {
  final AuthRepository authRepository = Get.find();
  final Encrypt encrypt = Get.find();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final usernameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  void signup(String username, String email, String password) {
    //enkripsi
    final encryptedPassword = encrypt.encryptData(password);
    authRepository.signup(username, email,
        encryptedPassword['encryptedPassword']!, encryptedPassword['iv']!);
  }
}
