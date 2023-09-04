import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';

import '../../../../routes/app_route_names.dart';

class LikesView extends StatelessWidget {
  LikesView({super.key});

  // final AuthStateController _authStateController = Get.put(AuthStateController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Container(
          child: (controller.isLoading) ? 
          (
            const Center(
              child: CircularProgressIndicator(),
            )
          ) : 
          (
             Column(
            children: [
              SizedBox(
                height: 40,
                width: Get.width,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search for your likes",
                    hintStyle: const TextStyle(
                      fontFamily: "Stinger"
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Likes",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Stinger"
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffFEDC00),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        controller.likedUsers.length.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15
                        ),
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: (controller.likedUsers.isEmpty) ? 
                (
                  const Center(
                    child: Text(
                      "You've not liked anyone",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Stinger"
                      )
                    ),
                  )
                ) : 
                (
                  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 250
                  ), 
                  itemCount: controller.likedUsers.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          matchProfileScreen,
                          arguments: {
                            "user": controller.likedUsers[index]
                          }
                        );
                      },
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(controller.likedUsers[index]["images"][0]),
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      controller.likedUsers[index]["name"],
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      "You've liked ${
                                        (controller.likedUsers[index]["Gender"] == "male") ? 
                                        ("him") : 
                                        ("her")
                                      }",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                )
                )
              )
            ],
          )
        )
        );
      }
    );
  }
}