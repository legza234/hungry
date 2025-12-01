import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';

class FoodCatgory extends StatefulWidget {
   FoodCatgory({super.key, required this.selcetedIndex, required this.category});
  final  int selcetedIndex;

  final List category ;

  @override
  State<FoodCatgory> createState() => _FoodCatgoryState();
}

class _FoodCatgoryState extends State<FoodCatgory> {
late int selcetedIndex ;
@override

  void initState() {
  selcetedIndex =widget.selcetedIndex;

  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return                 SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget. category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selcetedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selcetedIndex == index ?
                AppColor.Primru :
                Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomText(
                text:widget. category[index],
                Weight: FontWeight.bold,
                color: selcetedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          );
        }),
      ),
    );

  }
}
