import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find();
    final signupKey = GlobalKey<FormState>();

    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus,
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Form(
                  key: signupKey,
                  child: SizedBox(
                    height: 325,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //username
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username Tidak Boleh Kosong!";
                            }
                            return null;
                          },
                          controller: signupController.usernameController,
                          focusNode: signupController.usernameFocus,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Username")),
                        ),

                        //email
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email Tidak Boleh Kosong!";
                            }
                            return null;
                          },
                          controller: signupController.emailController,
                          focusNode: signupController.emailFocus,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Email")),
                        ),

                        //password
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password Tidak Boleh Kosong!";
                            }
                            return null;
                          },
                          controller: signupController.passwordController,
                          focusNode: signupController.passwordFocus,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Password")),
                        ),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (signupKey.currentState!.validate()) {
                                  signupController.signup(
                                      signupController.usernameController.text
                                          .trim(),
                                      signupController.emailController.text
                                          .trim(),
                                      signupController.passwordController.text
                                          .trim());
                                }
                              },
                              child: const Text("Register")),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sudah Punya Akun?"),
                            InkWell(
                              child: const Text(
                                " Login di Sini",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.back();
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          if (signupController.authRepository.isLoading.value) {
            return Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()));
          } else {
            return const SizedBox.shrink();
          }
        })
      ],
    );
  }
}
