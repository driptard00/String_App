import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:String/controller/authStateController.dart';

class DeleteAccountBottom{
  
  static showDeleteAccountBottom () {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
    Get.bottomSheet(
      GetBuilder<AuthStateController>(
        builder: (controller) {
          return Container(
            height: 700,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  flex: 17,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Container(
                            height: 5,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/deleteUser.png",
                                  height: 200,
                                  width: 200,
                                ),
                                Text(
                                  "Enter the name below to continue\n${controller.user.name}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
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
                                    labelText: "Enter name",
                                    floatingLabelBehavior: FloatingLabelBehavior.never
                                  ),
                                  validator:(value) {
                                    if (value != controller.user.name && value == null){
                                      return "Incorrect input";
                                    }else{
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.updateEmailDelete(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                  child: SizedBox(
                      height: 55,
                      width: Get.width,
                      child: TextButton(
                        onPressed: (() {
                          (_formKey.currentState!.validate())?
                            (controller.deleteUser()):
                            (AutovalidateMode.disabled);
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
                            "Delete Account",
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

              ],
            ),
          );
        }
      ),
      isScrollControlled: true
    );
  }
}