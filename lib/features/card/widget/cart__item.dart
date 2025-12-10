import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.image,
    required this.text,
    required this.decs,
    this.onAdd,
    this.onMin,
    this.onRemove,
    required this.number
  }
  );
final image,text,decs;
final Function ()? onAdd;
  final Function ()? onMin;
  final Function ()? onRemove;
  final int number ;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 120),
                CustomText(text: text, weight: FontWeight.bold),
                CustomText(
                  text: decs,
                  weight: FontWeight.normal,
                ),


              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onAdd,
                      child: CircleAvatar(
                        backgroundColor: AppColor.Primru,
                        child: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gap(20),
                    CustomText(text:number.toString(), weight: FontWeight.bold,size: 20,),
                    Gap(20),

                    GestureDetector(
                      onTap: onMin,
                      child: CircleAvatar(
                        backgroundColor: AppColor.Primru,
                        child: Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
                GestureDetector(
                  onTap:onRemove,
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        color: AppColor.Primru,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(
                      child: CustomText(text: "Remove", weight: FontWeight.bold,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
