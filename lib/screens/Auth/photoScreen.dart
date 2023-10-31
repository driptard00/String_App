import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:String/controller/authStateController.dart';
import 'package:String/routes/app_route_names.dart';

import '../../widgets/pickPhotosBottoms/pick_photos_bottom copy 2.dart';
import '../../widgets/pickPhotosBottoms/pick_photos_bottom copy 3.dart';
import '../../widgets/pickPhotosBottoms/pick_photos_bottom copy 4.dart';
import '../../widgets/pickPhotosBottoms/pick_photos_bottom copy 5.dart';
import '../../widgets/pickPhotosBottoms/pick_photos_bottom copy.dart';
import '../../widgets/pickPhotosBottoms/pick_photos_bottom.dart';


class PhotoScreen extends StatelessWidget {
  PhotoScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());


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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.photo_library_outlined,
                                        color: Colors.black,
                                        size: 70,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Add your best photos",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: "StingerBold"
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text(
                                    "Profile pictures leads to more matches",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text(
                                    "Select at least 3 images",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "Stinger"
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20,
                                    primary: false,
                                    shrinkWrap: true,
                                    children: [

                                      InkWell(
                                        onTap: () {
                                          PickPhotoBottomSheet.showPhotoBottomSheet();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage1 != null) 
                                                ? FileImage(controller.selectedImage1!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),  

                                      InkWell(
                                        onTap: () {
                                          PickPhotoBottomSheet2.showPhotoBottomSheet2();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage2 != null) 
                                                ? FileImage(controller.selectedImage2!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),  
                                      InkWell(

                                        onTap: () {
                                          PickPhotoBottomSheet3.showPhotoBottomSheet3();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage3 != null) 
                                                ? FileImage(controller.selectedImage3!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),  

                                      InkWell(
                                        onTap: () {
                                          PickPhotoBottomSheet4.showPhotoBottomSheet4();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage4 != null) 
                                                ? FileImage(controller.selectedImage4!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),  

                                      InkWell(
                                        onTap: () {
                                          PickPhotoBottomSheet5.showPhotoBottomSheet5();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage5 != null) 
                                                ? FileImage(controller.selectedImage5!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),  

                                      InkWell(
                                        onTap: () {
                                          PickPhotoBottomSheet6.showPhotoBottomSheet6();
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Colors.black,
                                              
                                            ),
                                            image: DecorationImage(
                                              image: (controller.selectedImage6 != null) 
                                                ? FileImage(controller.selectedImage6!)
                                                : const AssetImage("images/addImage.jpg") as ImageProvider,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),                                  
                                    ],
                                  )
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
                                    if(controller.selectedImage1 == null || controller.selectedImage2 == null || controller.selectedImage3 == null){
                                      Fluttertoast.showToast(
                                        msg: "Please select at least 3 images",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 15.0
                                      );
                                    }else{
                                      controller.setImage();
                                    }
                                  }),
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffFEDC00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                    )
                                  ),
                                  child:(controller.isLoading)?
                                  (
                                    const CircularProgressIndicator(
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