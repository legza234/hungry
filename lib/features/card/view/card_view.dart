import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/card/widget/cart__item.dart';
import 'package:hungry/shared/Custom_botton.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../checkout/view/chechout_view.dart' show ChechoutView;

class CardView extends StatefulWidget {
  const CardView({super.key});
  @override
  
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
final int itemCount=20;
  late List<int>  quantities;
  @override
  void initState() {
quantities = List.generate(itemCount, (_)=>1);
super.initState();
  }
  void onAdd (int index){
    setState((){
      quantities[index] ++ ;
    });
  }
  void onMin (int index){
    setState((){
if (quantities[index]>1){
  quantities[index] --;

}

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CartItem(
              image: "assets/burg 4.png",
              text: "Hamburger",
              decs: "Veggie Burger",
              number: quantities[index],
              onAdd: ()=> onAdd(index),
              onMin: ()  => onMin(index),

            );
          },
        ),
      ),

      bottomSheet: Container(
        padding:  EdgeInsets.all(10),
        color: Colors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CustomText(
                  text: "Total",
                  Weight: FontWeight.bold,
                  size: 18,
                ),
                CustomText(
                  text: "\$18.19",
                  Weight: FontWeight.bold,
                  size: 32,
                ),
              ],
            ),
            CustomBotton(
              text: "Checkout",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return ChechoutView();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
