import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:projek_ahir_mobile_teori/auth/login/controller/login_controller.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    final loginKey = GlobalKey<FormState>();

    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus,
          child: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Form(
                key: loginKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //email
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email Tidak Boleh Kosong!";
                            }
                            return null;
                          },
                          focusNode: loginController.emailFocus,
                          controller: loginController.emailController,
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
                          focusNode: loginController.passwordFocus,
                          controller: loginController.passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Password")),
                        ),

                        //submit
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (loginKey.currentState!.validate()) {
                                  loginController.login(
                                      loginController.emailController.text
                                          .trim(),
                                      loginController.passwordController.text
                                          .trim());
                                }
                              },
                              child: const Text("Login")),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Belum Punya Akun?"),
                            InkWell(
                              child: const Text(
                                " Signup di Sini",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Get.to(() => const SignupScreen());
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
          if (loginController.authRepository.isLoading.value) {
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
