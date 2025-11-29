import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';

import '../../../shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['ALL', 'COMBO', 'SLIDERS', 'CLASSIC'];
  int selcetedIndex =0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Gap(70),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/Hungry_.svg",
                        color: AppColor.Primru,
                        height: 40,
                      ),
                      Gap(10),
                      CustomText(
                        text: "Hello back",
                        color: AppColor.Primru,
                        Weight: FontWeight.w500,
                        size: 14,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(radius: 30),
                ],
              ),

              Gap(20),

              Material(
                elevation: 10,
                shadowColor: Colors.black26,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: AppColor.Primru,
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),

                    // لازم border عشان الشكل يبقى كامل
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColor.Primru,
                        width: 1.5,
                      ),
                    ),

                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              Gap(30),



              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(category.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selcetedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: selcetedIndex == index ? AppColor.Primru : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: CustomText(
                          text: category[index],
                          Weight: FontWeight.bold,
                          color: selcetedIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              Gap(20),

              Card(
                child: Padding(padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Image.asset("assets/burg 5.png",width: 150,),
                    Gap(10),
                    CustomText(text: "Cheeseburger", Weight: FontWeight.bold),
                    CustomText(text: "wendy", Weight: FontWeight.w500),
                    CustomText(text: " 3.4", Weight: FontWeight.w500),


                  ],
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
