import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';

class MatchProfileScreen extends StatelessWidget {
  MatchProfileScreen({super.key});

  var userDetails = Get.arguments["user"];

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
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 500,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.white
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(userDetails["images"][0]),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${userDetails["name"]}, ${controller.calculateAge(userDetails["dob"])}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  // fontFamily: "Stinger"
                                ),
                              ),
                              Text(
                                "${userDetails["occupation"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize:15,
                                  fontFamily: "Stinger"
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: const [
                                  // Text(
                                  //   "${userDetails["distance"]} | ",
                                  //   style: GoogleFonts.poppins(
                                  //     color: Colors.white,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                  // Text(
                                  //   "${userDetails["state"]}",
                                  //   style: GoogleFonts.poppins(
                                  //     color: Colors.white,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 15,),
                              const  Text(
                                "Bio",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                              Text(
                                "${userDetails["bio"]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Stinger"
                                ),
                              ),
                              const SizedBox(height: 15,),
                              const  Text(
                                "Other Photos",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Stinger"
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(userDetails["images"][1]),
                                  ),      
                                  SizedBox(width: 20,),
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(userDetails["images"][2]),
                                  ),     
                                  SizedBox(width: 20,),
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(userDetails["images"][3]),
                                  ),
                                  SizedBox(width: 20,),
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(userDetails["images"][4]),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(userDetails["images"][5]),
                                  ),      
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
              Positioned(
                child: SafeArea(
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        PopupMenuButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          itemBuilder:(context) {
                            return [
                              PopupMenuItem(
                                onTap: () {
                                  
                                },
                                child: const Text('Message'),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  
                                },
                                child: const Text('Like'),
                              ),
                            ];
                          },
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