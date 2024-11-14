import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:projek_ahir_mobile_teori/auth/login/screen/login_screen.dart';
import 'package:projek_ahir_mobile_teori/auth/signup/screen/signup_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            // Background Image
            SizedBox(
              width: double.infinity,
              height: 600,
              child: Container(
                color: const Color.fromARGB(255, 16, 16, 16),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: SizedBox.expand(
                    child: Placeholder(
                      strokeWidth: 0.2,
                    ),
                  ),
                ),
              ),
            ),

            // content
            Positioned(
              top: 550,
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                      color: Color(0xff262626)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox.expand(
                      child: Column(
                        children: [
                          const SizedBox(height: 12),

                          // Title
                          const Text(
                            'Welcome!',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                          const SizedBox(height: 12),

                          const Text(
                            'Lorem ipsum dolor sit amet, adisplicing elit. constructor plast',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 22),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0xffA57A03))),
                                onPressed: () {
                                  Get.to(() => const LoginScreen());
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                          ),
                          const SizedBox(height: 8),

                          // SignUp button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    side: WidgetStatePropertyAll(BorderSide(
                                        color: Color(0xffA57A03), width: 1)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 16, 16, 16))),
                                onPressed: () {
                                  Get.to(() => const SignupScreen());
                                },
                                child: const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Color(0xffA57A03), fontSize: 20),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
