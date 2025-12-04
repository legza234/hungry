import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.Primru,
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Gap(280),
     SvgPicture.asset("assets/Hungry_.svg"),
      Spacer(),
      Image.asset("assets/burg 1.png",height: 400,width: 400,fit: BoxFit.contain,),
      
    ],
  ),
),

    );
  }
}
