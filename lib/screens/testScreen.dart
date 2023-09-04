import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  var user = Get.arguments["user"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Text(
            user["name"],
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}