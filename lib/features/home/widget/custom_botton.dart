import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBotton extends StatelessWidget {
  const CustomAuthBotton({super.key, this.onTap, required this.text});
final Function()? onTap;
final String text;

  @override
  Widget build(BuildContext context) {
    return                 GestureDetector(
      onTap: onTap ,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),

        width: double.infinity,
        child: Center(
          child: CustomText(
            text: 'Sing Up',
            color: AppColor.Primru,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );

  }
}
