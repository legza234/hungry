import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/widget/card_item.dart';
import 'package:hungry/features/auth/widget/food_catgory.dart';
import 'package:hungry/features/auth/widget/search_field.dart';
import 'package:hungry/features/auth/widget/user_header.dart';

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
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [


            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight:170,
              flexibleSpace:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
                child: Column(
                  children: [
                    UserHeader(),


                    SearchField(),
                    Gap(10),

                  ],
                ),

              ),
            ),

            SliverToBoxAdapter(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [

                    FoodCatgory(selcetedIndex: selcetedIndex, category: category),


                  ],
                ),
              ),
            ),


            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => CardItem(
                    image: "assets/burg 5.png",
                    text: "Cheeseburger",
                    desc: "Wendy's Burger",
                    rate: "4.9",
                  ),
                  childCount: 8,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.71,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
