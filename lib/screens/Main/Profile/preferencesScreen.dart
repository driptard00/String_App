import 'package:String/widgets/editProfileBottoms/editProfileOneBottom%20copy%202.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

import '../../../widgets/editProfileBottoms/editProfileOneBottom copy 3.dart';
import '../../../widgets/editProfileBottoms/editProfileOneBottom copy 4.dart';
import '../../../widgets/editProfileBottoms/editProfileOneBottom copy 5.dart';
import '../../../widgets/editProfileBottoms/editProfileOneBottom copy.dart';
import '../../../widgets/editProfileBottoms/editProfileOneBottom.dart';

class PreferencesScreen extends StatelessWidget {
  PreferencesScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  @override
  Widget build(BuildContext context) {

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   print("Hey Before Call");
    //   _authStateController.getUserDetails();
    //   print("Hey After Call");
    // },);


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
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: (controller.isLoading) ? 
                    (
                      const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffFEDC00)
                        ),
                      )
                    ) : 
                    (
                      SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text(
                                      'My Preferences',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(editProfile);
                                },
                                child: const Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    color: Color(0xffFEDC00),
                                    fontSize: 15,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 140,
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundImage: (controller.selectedImage1 != null)?
                                          FileImage(controller.selectedImage1!)
                                          : 
                                          (controller.user.images!.isEmpty)?
                                          const AssetImage("images/avatar.jpg") as ImageProvider
                                          : NetworkImage(controller.user.images![0])
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Center(
                                            child: InkWell(
                                              onTap: (() {
                                                EditImageBottom1.showEditImageBottom1();
                                              }),
                                              child: Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color: const Color(0xffFEDC00),
                                                ),
                                                child: const Icon(
                                                  Icons.camera,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    controller.user.name!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    (controller.location == "")?
                                    (
                                      "Enable Location"
                                    ) :
                                    (
                                      controller.location
                                    ),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "About me",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  (controller.user.bio! == "")?
                                  ("Not specified"):
                                  (controller.user.bio!),
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Status: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    Text(
                                     (controller.user.status! == "")?
                                     ("Not specified"):
                                     (controller.user.status!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Height: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    Text(
                                      (controller.user.height == "")?
                                      (
                                        "0"
                                      ):
                                      (
                                        controller.user.height.toString()
                                      ),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Hair Color: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    Text(
                                      (controller.user.haircolor! == "")?
                                      ("Not specified"):
                                      (controller.user.haircolor!),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Kids: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    Text(
                                      (controller.user.kids == null)?
                                      (
                                        "Not specified"
                                      ):
                                      (
                                        controller.user.kids.toString()
                                      ),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Row(
                              children: [
                                const Text(
                                  "Age: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  controller.calculateAge(controller.dateController.text).toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),          
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Row(
                              children: [
                                const Text(
                                  "Occupation: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  (controller.user.occupation == "")?
                                  (
                                    "Not specified"
                                  ):
                                  (
                                    controller.user.occupation.toString()
                                  ),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Row(
                              children: [
                                const Text(
                                  "Interest: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  (controller.user.interests == "")?
                                  (
                                    "Not specified"
                                  ):
                                  (
                                    controller.user.interests.toString()
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Row(
                              children: [
                                const Text(
                                  "Looking for: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                Text(
                                  controller.user.dating!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  "Other Photos",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row( 
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (() {
                                          EditImageBottom2.showEditImageBottom2();
                                        }),
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: (controller.selectedImage2 != null)?
                                          FileImage(controller.selectedImage2!)
                                          : 
                                          (controller.user.images!.isNotEmpty)
                                          ? NetworkImage(controller.user.images![1])
                                          : const AssetImage("images/profileAvatar.png") as ImageProvider
                                        ),
                                      ),
                                    ),   
                                    const SizedBox(width: 20,), 
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          EditImageBottom3.showEditImageBottom3();
                                        },
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: (controller.selectedImage3 != null)?
                                          FileImage(controller.selectedImage3!)
                                          : 
                                          (controller.user.images!.isNotEmpty)
                                          ? NetworkImage(controller.user.images![2])
                                          : const AssetImage("images/profileAvatar.png") as ImageProvider
                                        ),
                                      ),
                                    ),   
                                    const SizedBox(width: 20,), 
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          EditImageBottom4.showEditImageBottom4();
                                        },
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: (controller.selectedImage4 != null)?
                                          FileImage(controller.selectedImage4!)
                                          : 
                                          (controller.user.images!.isNotEmpty)
                                          ? NetworkImage(controller.user.images![3])
                                          : const AssetImage("images/profileAvatar.png") as ImageProvider
                                        ),
                                      ),
                                    ),   
                                    const SizedBox(width: 20,), 
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          EditImageBottom5.showEditImageBottom5();
                                        },
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundImage: (controller.selectedImage5 != null)?
                                          FileImage(controller.selectedImage5!)
                                          : 
                                          (controller.user.images!.isNotEmpty)
                                          ? NetworkImage(controller.user.images![4])
                                          : const AssetImage("images/profileAvatar.png") as ImageProvider
                                        ),
                                      ),
                                    ),   
                                    const SizedBox(width: 20,), 
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        EditImageBottom6.showEditImageBottom6();
                                      },
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundImage: (controller.selectedImage6 != null)?
                                          FileImage(controller.selectedImage6!)
                                          : 
                                        (controller.user.images!.isNotEmpty)
                                        ? NetworkImage(controller.user.images![5])
                                        : const AssetImage("images/profileAvatar.png") as ImageProvider
                                      ),
                                    ),  
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                    ) ,
                    )
                  ),
                )
              ),
              )
            ],
          )
        );
      }
    );
  }
}