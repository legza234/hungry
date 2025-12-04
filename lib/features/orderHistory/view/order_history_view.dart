import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/shared/Custom_botton.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

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
      ),      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset( "assets/burg 4.png", width: 120),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Hamburger", Weight: FontWeight.bold),

                        CustomText(text: "QTY:X2", Weight: FontWeight.normal),
                        CustomText(
                          text:"Pric: 20",
                          Weight: FontWeight.normal,
                        ),


                      ],
                    ),
                    CustomBotton(text: "Re Order",)

                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
