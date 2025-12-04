import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../../core/constants/app_color.dart';

class ChechoutView extends StatelessWidget {
  const ChechoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap:  (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new,color: AppColor.Primru,)),
      ),     backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Order summary",
              Weight: FontWeight.bold,
              size: 20,
            ),
            Gap(20),
            checkoutWidget("order", 14.34,false,false),

            checkoutWidget("Taxes", 0.3,false,false),

            checkoutWidget("Delivery fees", 1.5,false,false),
            Divider(),
            checkoutWidget("Total", 105,true,false),
            checkoutWidget("Total", 105,true,true),
            Gap(20),
            CustomText(
              text: "Payment methods",
              Weight: FontWeight.bold,
              size: 20,
            ),

          ],
        ),
      ) ,
    );
  }
}
Widget checkoutWidget (tittle, price,isBold,isSmall){
return Padding(
  padding: const EdgeInsets.all(15.0),


  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
        CustomText(text: tittle,
            Weight:isBold?FontWeight.bold: FontWeight.normal,size:isSmall?13: 15,
          color: isBold ? Colors.black: Colors.grey.shade600,
        ),

        CustomText(text: '$price \$',
            Weight:isBold?FontWeight.bold: FontWeight.normal,size: 15,
        color: isBold ? Colors.black: Colors.grey.shade600,
        ),
      ],
  ),
);
}