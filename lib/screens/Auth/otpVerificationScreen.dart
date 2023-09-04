import 'package:String/controller/authStateController.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "OTP Verification",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontFamily: "StingerBold"
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text(
                                          "Enter the 4 digit otp sent to ${controller.email}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Stinger"
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        PinCodeTextField(
                                          appContext: context,
                                          length: 4, 
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          onChanged: (value){
                                            controller.updateOtp(value);
                                          },
                                          pinTheme: PinTheme(
                                            fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 20),
                                            activeColor: Colors.black,
                                            activeFillColor: Colors.black,
                                            inactiveColor: Colors.black,
                                            selectedFillColor: Colors.black,
                                            selectedColor: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.resendOtp();
                                    },
                                    child: (controller.isLoading)?
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    :
                                    const Text(
                                      "Resend Otp",
                                      style: TextStyle(
                                        color: Color(0xffFEDC00)
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 400
                                  ),
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 55,
                                          width: Get.width,
                                          child: TextButton(
                                            onPressed: (() {
                                              controller.verifyEmail();
                                            }),
                                            style: TextButton.styleFrom(
                                              backgroundColor: const Color(0xffFEDC00),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30)
                                              )
                                            ),
                                            child: (controller.isLoading)?
                                            (
                                              const CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            ):
                                            (
                                              const Text(
                                                "Verify",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily: "Stinger"
                                                ),
                                              )
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ),
                        // Expanded(
                        //   flex: 8,
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 20),
                        //     child: Column(
                        //       children: [

                        //       ],
                        //     ),
                        //   )
                        // ),
                      ],
                    ),
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