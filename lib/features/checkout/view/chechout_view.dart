import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widget/order_details_widget.dart';
import 'package:hungry/shared/Custom_botton.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../../core/constants/app_color.dart';
import '../widget/payment_method_selector.dart';
import '../widget/success_daliog.dart';

class ChechoutView extends StatelessWidget {
  const ChechoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios_new,color: AppColor.Primru,),
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
              OrderDetailsWidget(order: "12", taxes: "12", fees: "99", total: "104"),

              CustomText(
                text: "Payment methods",
                Weight: FontWeight.bold,
                size: 20,
              ),
              Gap(20),

              PaymentMethodSelector(
                initialValue: "cash",
                onChanged: (value) {
                  print("Selected payment: $value");
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Total", Weight: FontWeight.bold,size: 18,),
                      CustomText(text: "\$18.19", Weight: FontWeight.bold,size: 32,),


                    ],
                  ),
                  CustomBotton(
                    text: "Pay Now",
                    onTap: () {
                      showPaymentSuccessDialog(context);
                    },
                  )


                ],
              ),
              Gap(30)



            ],
          ),
        ) ,
      ),
    );
  }
}
