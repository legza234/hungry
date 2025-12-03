import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Slider;
import 'package:gap/gap.dart' show Gap;

import '../../../core/constants/app_color.dart' show AppColor;
import '../../../shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
final double value ;
final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image.asset("assets/burer6.png",height:250 ,),
        Spacer(),
        Column(
          children: [
            CustomText(
                text: "Customize Your Burger\n to Your Tastes. Ultimate\n Experience",
                Weight: FontWeight.normal),
            Slider(
              max: 1,
              min: 0,
              value: widget. value,
              onChanged:widget.onChanged,
              activeColor: AppColor.Primru,


            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/hot.png"),
                Gap(120),
                Image.asset("assets/cold.png"),



              ],
            )
          ],
        )
      ],
    );
   ;
  }
}
