import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/controller/authStateController.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Column(
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
                  hintText: "Search for your matches",
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
                  "Matches",
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
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      controller.matchedUsers.length.toString(),
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
              child: (controller.matchedUsers.isEmpty) ? 
                  (
                    const Center(
                      child: Text(
                        "You've not matched with anyone",
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
                    itemCount: controller.matchedUsers.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CircleAvatar(
                                radius: 80,
                              ),
                              SizedBox(
                                child: Column(
                                  children: const [
                                    Text(
                                      "Akintade Oluwaseun",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Stinger"
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "You've liked him",
                                      style: TextStyle(
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
                      );
                    })
                  )
                  )
            )
          ],
        );
      }
    );
  }
}