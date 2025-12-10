import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/Custom_botton.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: AppColor.Primru,
              size: 70,
            ),
            const SizedBox(height: 15),
            CustomText(
              text: "Success !",
              weight: FontWeight.bold,
              size: 18,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            CustomText(
              text: "Your order is now confirmed.",
              weight: FontWeight.normal,
              color: Colors.grey.shade700,
            ),
            const SizedBox(height: 20),
            CustomBotton(
              text: "Go Back",
              onTap: () {
                Navigator.of(context).pop(); // يقفل الديالوج
              },
            )
          ],
        ),
      ),
    );
  }
}


void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => const PaymentSuccessDialog(),
  );
}
