import 'package:String/controller/authStateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDetailsScreen extends StatefulWidget {
  const GetDetailsScreen({super.key});

  @override
  State<GetDetailsScreen> createState() => _GetDetailsScreenState();
}

final AuthStateController _authStateController = Get.put(AuthStateController());

class _GetDetailsScreenState extends State<GetDetailsScreen> {

  @override
  void initState() {
    _authStateController.getUserProfile();
    // _authStateController.logoutAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xffFEDC00),
          ),
        ),
      ),
    );
  }
}