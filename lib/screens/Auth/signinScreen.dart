import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:String/services/auth_services.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());
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
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sign in",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontFamily: "StingerBold"
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          const Text(
                                            "Please enter your details below to continue",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: "Stinger"
                                            ),
                                          ),
                                          const SizedBox(height: 30,),
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
                                              prefixIcon: const Icon(
                                                Icons.email,
                                                color: Colors.black,
                                              ),
                                              labelText: "Email",
                                              floatingLabelBehavior: FloatingLabelBehavior.never
                                            ),
                                            validator: ValidationBuilder().email().build(),
                                            onChanged: (value) {
                                              controller.updateEmail(value);
                                            },
                                          ),
                                          const SizedBox(height: 10,),
                                          TextFormField(
                                            keyboardType: TextInputType.visiblePassword,
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
                                                Icons.lock,
                                                color: Colors.black,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  controller.toggleHidePassword();
                                                },
                                                icon: Icon(
                                                  (controller.hidePassword)?
                                                  (Icons.visibility_off):
                                                  (Icons.visibility),
                                                  color: Colors.black,
                                                ),
                                              ),
                                              labelText: "Password",
                                              floatingLabelBehavior: FloatingLabelBehavior.never
                                            ),
                                            obscureText: controller.hidePassword,
                                            validator: ValidationBuilder().minLength(6).build(),
                                            onChanged: (value) {
                                              controller.updatePassword(value);
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: (){
                                                  Get.toNamed(forgotPasswordScreen);
                                                }, 
                                                child: const Text(
                                                  "Forgot Password ?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xffFEDC00),
                                                    fontSize: 14,
                                                    fontFamily: "Stinger"
                                                  ),
                                                )
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 55,
                                            width: Get.width,
                                            child: TextButton(
                                              onPressed: (() {
                                                (_formKey.currentState!.validate())?
                                                (controller.loginUser()):
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
                                                  "Sign in",
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
                                          const SizedBox(height: 30,),
                                          Row(
                                            children: const [
                                              Expanded(
                                                flex: 1,
                                                child: Divider(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "or continue with",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: "Stinger"
                                                  ),
                                                ),
                                              ),            
                                              SizedBox(width: 20,),
                                              Expanded(
                                                flex: 1,
                                                child: Divider(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 30,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black
                                                  )
                                                ),
                                                child: Image.asset(
                                                  "images/facebook.png",
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(
                                                      color: Colors.black
                                                    )
                                                  ),
                                                  child: Image.asset(
                                                    "images/google.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),                              
                                              Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.black
                                                  )
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/apple.png",
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 30,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Don't have an account?",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: "Stinger"
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: (() {
                                                  Get.toNamed(signupScreen);
                                                }),
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)
                                                  )
                                                ),
                                                child: const Text(
                                                  "Sign up",
                                                  textAlign: TextAlign.center,
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
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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