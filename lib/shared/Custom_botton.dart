import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';
import 'custom_text.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, this.onTap});

  final String text ;
  final Function ()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
            color: AppColor.Primru,
            borderRadius: BorderRadius.circular(15)
        ),


        child: CustomText(text: text, weight: FontWeight.normal,color: Colors.white,),
      ),
    );
  }
}
