import 'package:String/controller/authStateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/appStateController.dart';
import 'package:String/routes/app_route_names.dart';

class StringPremiumScreen extends StatelessWidget {
  StringPremiumScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.black,
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
                right: -250,
                top: -200,
                child: Container(
                  height: 500,
                  width: 550,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    border: Border.all(
                      color: const Color(0xffFEDC00).withOpacity(0.2),
                    )
                  ),
                )
              ),
              Positioned(
                left: -150,
                bottom: -50,
                child: Container(
                  height: 500,
                  width: 550,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    border: Border.all(
                      color: const Color(0xffFEDC00).withOpacity(0.2),
                    ),
                  ),
                )
              ),
              Positioned(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: (controller.isLoading)?
                    const  Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffFEDC00),
                      ),
                    )
                    :
                    Column(
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Text(
                          '"String" Premium',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Stinger"
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Text(
                              'Current Plans',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Stinger"
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Expanded(
                          child: ListView.separated(
                            itemCount: controller.paymentDetails.length,
                            primary: false,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                height: 180,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffFEDC00)
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: InkWell(
                                        onTap: () {
                                          controller.updateSelectedPlan(controller.paymentDetails[index]["price"]);
                                          controller.paymentTopUp(_authStateController.user.id!, _authStateController.user.email!);
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                               "${controller.paymentDetails[index]["type"]} ${controller.paymentDetails[index]["price"]}",
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                )
                                              ),
                                              Text(
                                                'Get ${controller.paymentDetails[index]["hearts"]} Hearts',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                controller.paymentDetails[index]["specials"],
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width: Get.width,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffFEDC00),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          )
                                        ),
                                        child: Text(
                                          controller.paymentDetails[index]["description"],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: "Stinger"
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ) ,
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