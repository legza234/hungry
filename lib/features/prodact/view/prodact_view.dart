import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/prodact/widgets/spicy_slider.dart';
import 'package:hungry/features/prodact/widgets/toppin_card.dart';
import 'package:hungry/shared/Custom_botton.dart';
import 'package:hungry/shared/custom_text.dart';

class ProdactView extends StatefulWidget {
   ProdactView({super.key});

  double value =0.5 ;

  @override
  State<ProdactView> createState() => _ProdactViewState();
}

class _ProdactViewState extends State<ProdactView> {
  double value =0.5 ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap:  (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new,color: AppColor.Primru,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: value,
                onChanged: (v) {
                  setState(() => value = v);
                  print(value);
                },
              ),
              Gap(20),
              CustomText(text: "Toppings", weight: FontWeight.bold,size: 18,),
              Gap(20),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:List.generate(4, (index){
                    return ToppinCard(name: "name", imagePath: "assets/topping/salad.png") ;
                  }
                  )
          
          
                ),
              ),
              Gap(20),
              CustomText(text: "Side options", weight: FontWeight.bold,size: 18,),
              Gap(20),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:List.generate(4, (index){
                      return ToppinCard(name: "name", imagePath: "assets/topping/salad.png") ;
                    }
                    )
          
          
                ),
              ),
              Gap(40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Total", weight: FontWeight.bold,size: 18,),
                      CustomText(text: "\$18.19", weight: FontWeight.bold,size: 32,),


                    ],
                  ),
                  CustomBotton(text: "Add To Card",onTap: (){},)
                ],
              ),
              Gap(40),
          
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}
