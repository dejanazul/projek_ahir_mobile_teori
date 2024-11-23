import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_ahir_mobile_teori/auth/login/screen/login_screen.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find();
    final signupKey = GlobalKey<FormState>();

    // Warna fokus (sama dengan warna tombol)
    const Color focusColor = Color(0xFFFF4B00);

    // Visibility toggle for password
    final RxBool isPasswordVisible = false.obs;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        "CREATE NEW ACCOUNT",
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
                        "Set up your username, email and password,\nYou can always change it later!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: signupKey,
                      child: Column(
                        children: [
                          // Username
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username Tidak Boleh Kosong!";
                              }
                              return null;
                            },
                            controller: signupController.usernameController,
                            focusNode: signupController.usernameFocus,
                            decoration: InputDecoration(
                              labelText: "Username",
                              prefixIcon: const Icon(Icons.person_outline),
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
                          // Email
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
                            controller: signupController.emailController,
                            focusNode: signupController.emailFocus,
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
                          // Password with Obscure Eye
                          Obx(() => TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password Tidak Boleh Kosong!";
                                  }
                                  return null;
                                },
                                controller: signupController.passwordController,
                                focusNode: signupController.passwordFocus,
                                obscureText: !isPasswordVisible.value,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.lock_outline),
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
                          // Signup Button
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
                              onPressed: () {
                                if (signupKey.currentState!.validate()) {
                                  signupController.signup(
                                    signupController.usernameController.text
                                        .trim(),
                                    signupController.emailController.text
                                        .trim(),
                                    signupController.passwordController.text
                                        .trim(),
                                  );
                                }
                              },
                              child: Text(
                                "Signup",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 14),
                              ),
                              InkWell(
                                child: const Text(
                                  " Log in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: focusColor,
                                  ),
                                ),
                                onTap: () {
                                  Get.to(() => const LoginScreen());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Loading Indicator
        floatingActionButton: Obx(() {
          if (signupController.authRepository.isLoading.value) {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
