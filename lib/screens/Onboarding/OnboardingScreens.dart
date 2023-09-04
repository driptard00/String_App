import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';

class OnboardingScreens extends StatelessWidget {
  OnboardingScreens({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: controller.onboardingScreens[controller.selectedIndex]
        );
      }
    );
  }
}