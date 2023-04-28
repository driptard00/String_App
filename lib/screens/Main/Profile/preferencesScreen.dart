import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

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
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: (controller.user.images != null)
                                    ? NetworkImage(controller.user.images![0])
                                    : const AssetImage("images/avatar.jpg") as ImageProvider
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
                              children: [
                                const  Text(
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
                                    CircleAvatar(
                                      radius: 35,
                                      // backgroundImage: (controller.user.images![1] != "")
                                      // ? NetworkImage(controller.user.images![1])
                                      // : const AssetImage("images/profileAvatar.png") as ImageProvider
                                    ),   
                                    const SizedBox(width: 20,), 
                                    CircleAvatar(
                                      radius: 35,
                                      // backgroundImage: (controller.user.images![2] != "")
                                      // ? NetworkImage(controller.user.images![2])
                                      // : const AssetImage("images/profileAvatar.png") as ImageProvider
                                    ),   
                                    const SizedBox(width: 20,), 
                                    CircleAvatar(
                                      radius: 35,
                                      // backgroundImage: (controller.user.images![3] != "")
                                      // ? NetworkImage(controller.user.images![3])
                                      // : const AssetImage("images/profileAvatar.png") as ImageProvider
                                    ),   
                                    const SizedBox(width: 20,), 
                                    CircleAvatar(
                                      radius: 35,
                                      // backgroundImage: (controller.user.images![4] != "")
                                      // ? NetworkImage(controller.user.images![4])
                                      // : const AssetImage("images/profileAvatar.png") as ImageProvider
                                    ),   
                                    const SizedBox(width: 20,), 
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      // backgroundImage: (controller.user.images![5] != "")
                                      // ? NetworkImage(controller.user.images![5])
                                      // : const AssetImage("images/profileAvatar.png") as ImageProvider
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