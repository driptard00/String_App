import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:heroicons/heroicons.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20,),
                      const Text(
                        'Chats',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Stinger"
                        ),
                      ),
                      const SizedBox(height: 20,),
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
                            hintText: "Search for chats",
                            hintStyle: const TextStyle(
                              fontFamily: "Stinger"
                            )
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Text(
                            "Messages",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Stinger"
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xffFEDC00),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(
                                "20",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 70,
                            width: Get.width,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: const CircleAvatar(
                                      radius: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 7,
                                                child: Text(
                                                  "Akintade Oluwaseun",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: "Stinger"
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Text(
                                                    "5 min ago",
                                                    style: GoogleFonts.poppins(
                                                      color: const Color(0xff4285F4),
                                                      fontSize: 10
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),    
                                        Container(
                                          child: Row(
                                            children: [
                                              const Expanded(
                                                flex: 8,
                                                child: Text(
                                                  "Awsome what kind of stiff do you like to do for fun",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: "Stinger"
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  child: Flexible(
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff4285F4),
                                                        borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      child: Text(
                                                        "4",
                                                        style: GoogleFonts.poppins(
                                                          color: Colors.white,
                                                          fontSize: 10
                                                        ),
                                                      ),
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),                
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }), 
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        }), 
                        itemCount: 6
                      )
                    ],
                  ),
                ) ,
              ),
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color(0xffFEDC00),
        child: const HeroIcon(
          HeroIcons.plus,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}