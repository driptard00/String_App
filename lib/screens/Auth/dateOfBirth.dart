import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

class DateOfBirthScreen extends StatelessWidget {
  DateOfBirthScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

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
                          flex: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("images/cake.png")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "When were you born?",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: "StingerBold"
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                  TextFormField(
                                    onTap: (() {
                                      FocusScope.of(context).requestFocus(FocusNode());
                                      controller.showDateTimePicker(context);
                                    }),
                                    keyboardType: TextInputType.datetime,
                                    controller: controller.dateController,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.black
                                        )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.black
                                        )
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.calendar_month,
                                        color: Colors.black,
                                      ),
                                      labelText: "Select date of birth",
                                      floatingLabelBehavior: FloatingLabelBehavior.never
                                    ),
                                    onChanged: (value) {
                                      controller.updateSelectedDate(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: SizedBox(
                                height: 55,
                                width: Get.width,
                                child: TextButton(
                                  onPressed: (() {
                                    controller.createProfile();
                                  }),
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffFEDC00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                    )
                                  ),
                                  child:(controller.isLoading)?
                                  (
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  ):
                                  (
                                     const Text(
                                    "Continue",
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
                            ),
                          )
                        ),
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