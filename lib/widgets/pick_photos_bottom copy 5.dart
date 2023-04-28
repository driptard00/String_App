import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:String/controller/authStateController.dart';

class PickPhotoBottomSheet5{
  
  static showPhotoBottomSheet5 () {
    Get.bottomSheet(
      GetBuilder<AuthStateController>(
        builder: (controller) {
          return Container(
            height: 200,
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
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (() {
                            controller.getImageFive(ImageSource.gallery);
                          }),
                          child: Container(
                            height: 50,
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black
                              ),
                              color: Colors.white.withOpacity(0),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.camera,
                                  color: Color(0xffFEDC00),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Camera roll",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            controller.getImageFive(ImageSource.camera);
                          }),
                          child: Container(
                            height: 50,
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black
                              ),
                              color: Colors.white.withOpacity(0),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Color(0xffFEDC00),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Take Photo",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: "Stinger"
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}