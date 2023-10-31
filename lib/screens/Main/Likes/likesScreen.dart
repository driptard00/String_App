import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:String/screens/Main/Likes/tabViews/likesView.dart';
import 'package:String/screens/Main/Likes/tabViews/matchesView.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      TabBar(
                        indicator: BoxDecoration(
                          color: Color(0xffFEDC00),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Stinger"
                        ),
                        tabs: const [
                          Tab(
                            text: "Likes",
                          ),
                          Tab(
                            text: "Matches",
                          ),
                        ]
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: Container(
                          child: TabBarView(
                            children: [
                              LikesView(),
                              MatchesView()
                            ],
                          ),
                        )
                      )
                    ],
                  ) ,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}