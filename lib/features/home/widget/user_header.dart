
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            SvgPicture.asset(
              "assets/Hungry_.svg",
              color: AppColor.Primru,
              height: 40,
            ),
            Gap(10),
            CustomText(
              text: "Hello back",
              color: AppColor.Primru,
              weight: FontWeight.w500,
              size: 14,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(radius: 30,
            child: Icon(
              CupertinoIcons.person, color: AppColor.Primru,weight: 30,),
            backgroundColor: Colors.grey.shade300, ),
      ],
    );
  }
}
