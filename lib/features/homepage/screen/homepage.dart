import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:projek_ahir_mobile_teori/features/homepage/controller/homepage_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomepageController homepageController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: FilledButton(
                onPressed: () {
                  homepageController.logout();
                },
                child: const Text("Logout")),
          )
        ],
      ),
    );
  }
}
