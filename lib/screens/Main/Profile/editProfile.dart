import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

import '../../../widgets/pick_photos_bottom.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: SafeArea(
                  child: (controller.isLoading) ?
                  const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffFEDC00),
                    ),
                  ):
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: SingleChildScrollView(
                            child: Column(
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
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Container(
                                  height: 130,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 60,
                                          backgroundImage: (controller.user.images != null)
                                        ? NetworkImage(controller.user.images![0])
                                        : const AssetImage("images/avatar.jpg") as ImageProvider
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: InkWell(
                                            onTap: (() {
                                              PickPhotoBottomSheet.showPhotoBottomSheet();
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
                                const SizedBox(height: 20,),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "About me / Bio",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.bioController,
                                        keyboardType: TextInputType.multiline,
                                        maxLength: 100,
                                        maxLines: 5,
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
                                      const Text(
                                        "Height (cm/m)",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.heightController,
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
                                      const Text(
                                        "Hair Color",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.hairColorController,
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
                                        ),
                                        validator: ValidationBuilder().minLength(2).maxLength(50).build(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Status",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.statusController,
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
                                      const Text(
                                        "Kids",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.kidsController,
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
                                      const Text(
                                        "Date of Birth",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
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
                                          floatingLabelBehavior: FloatingLabelBehavior.never
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
                                      const Text(
                                        "Occupation",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.occupationController,
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
                                        ),
                                        validator: ValidationBuilder().minLength(2).maxLength(50).build(),
                                        onChanged: (value) {
                                          controller.updateOccupation(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Interests",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      TextFormField(
                                        controller: controller.interestsController,
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
                                        ),
                                        validator: ValidationBuilder().minLength(2).maxLength(50).build(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Looking for",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: "Stinger"
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      DropdownButtonFormField(
                                        value: controller.user.dating,
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
                                        ),
                                        items: controller.datings.map((elements) {
                                          return DropdownMenuItem(
                                            value: elements,
                                            child: Text(
                                              elements
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          controller.updateSelectedDating(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: SizedBox(
                                height: 55,
                                width: Get.width,
                                child: TextButton(
                                  onPressed: (() {
                                    controller.editProfile();
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
                                      "Save",
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
                          ),
                        )
                      ],
                    ) ,
                  ),
                )
              ),
            ],
          )
        );
      }
    );
  }
}