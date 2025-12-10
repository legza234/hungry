import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';
import '../view/chechout_view.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key, required this.order, required this.taxes, required this.fees, required this.total});
final String order , taxes , fees , total ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        checkoutWidget("order", order,false,false),

        checkoutWidget("Taxes", taxes,false,false),

        checkoutWidget("Delivery fees", fees,false,false),

        Divider(),
        checkoutWidget("Total", total,true,false),
        checkoutWidget("Estimated delivery time:", '15 - 30 mins',true,true),
        Gap(20),
      ],
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
          weight:isBold?FontWeight.bold: FontWeight.normal,size:isSmall?13: 15,
          color: isBold ? Colors.black: Colors.grey.shade600,
        ),

        CustomText(text: '$price \$',
          weight:isBold?FontWeight.bold: FontWeight.normal,size: 15,
          color: isBold ? Colors.black: Colors.grey.shade600,
        ),
      ],
    ),
  );
}