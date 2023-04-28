import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class VerifyEmailScreen extends StatefulWidget {
  VerifyEmailScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    Future.delayed(
     const  Duration(seconds: 2),
      (() {
        Get.offAllNamed(genderScreen);
      })
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
              ),
              Positioned(
                left: -100,
                top: -100,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                right: -150,
                bottom: Get.height / 3,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: const Color(0xffFEDC00).withOpacity(0.1)
                  ),
                )
              ),
              Positioned(
                right: 320,
                bottom: 730,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xffFEDC00)
                  ),
                )
              ),
              Positioned(
                right: 100,
                bottom: 700,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFEDC00)
                  ),
                )
              ),
              Positioned(
                left: -20,
                bottom: 400,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFEDC00)
                  ),
                )
              ),
              Positioned(
                right: 40,
                bottom: 200,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFEDC00)
                  ),
                )
              ),
              Positioned(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text(
                              "We have sent a link to your email\n${controller.email}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        );
      }
    );
  }
}