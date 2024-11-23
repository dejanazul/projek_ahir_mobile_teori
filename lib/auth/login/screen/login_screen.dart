import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_ahir_mobile_teori/auth/login/controller/login_controller.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    final loginKey = GlobalKey<FormState>();

    // Warna tombol untuk fokus
    const Color focusColor = Color(0xFFFF4B00);

    // Visibility toggle for password
    final RxBool isPasswordVisible = false.obs;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        Center(
                          child: Text(
                            "LOGIN TO YOUR ACCOUNT",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            "Enter your email and password below\nto access your account.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Form fields
                        Form(
                          key: loginKey,
                          child: Column(
                            children: [
                              // Email Field
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email Tidak Boleh Kosong!";
                                  }

                                  final emailRegex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
                                  if (!emailRegex.hasMatch(value)) {
                                    return "Email tidak valid!";
                                  }

                                  return null;
                                },
                                focusNode: loginController.emailFocus,
                                controller: loginController.emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: focusColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Password Field with obscure toggle
                              Obx(() => TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password Tidak Boleh Kosong!";
                                      }
                                      return null;
                                    },
                                    obscureText: !isPasswordVisible.value,
                                    focusNode: loginController.passwordFocus,
                                    controller:
                                        loginController.passwordController,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon:
                                          const Icon(Icons.lock_outline),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          isPasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          isPasswordVisible.value =
                                              !isPasswordVisible.value;
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: focusColor,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(height: 40),
                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: focusColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (loginKey.currentState!.validate()) {
                                      loginController.login(
                                        loginController.emailController.text
                                            .trim(),
                                        loginController.passwordController.text
                                            .trim(),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Signup Redirect
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account?",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    InkWell(
                                      child: const Text(
                                        " Signup",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: focusColor,
                                        ),
                                      ),
                                      onTap: () {
                                        Get.to(() => const SignupScreen());
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Loading Indicator
              Obx(() {
                if (loginController.authRepository.isLoading.value) {
                  return Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
