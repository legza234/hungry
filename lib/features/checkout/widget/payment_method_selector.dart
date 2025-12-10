import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_text.dart';

class PaymentMethodSelector extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;

  const PaymentMethodSelector({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  late String selectedPayment;

  @override
  void initState() {
    super.initState();
    selectedPayment = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        paymentTile(
          title: "Cash on Delivery",
          value: "cash",
          image: "assets/cash.png",
          subtitle: "012087435668",
        ),
        const Gap(10),
        paymentTile(
          title: "Debit card",
          value: "card",
          image: "assets/visa.png",
          subtitle: "3566 **** **** 0505",
        ),
      ],
    );
  }

  Widget paymentTile({
    required String title,
    required String value,
    required String image,
    String? subtitle,
  }) {
    bool isSelected = selectedPayment == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
        widget.onChanged(value);
      },
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding:  EdgeInsets.symmetric(vertical: 10),
        tileColor: isSelected ?  Colors.grey.shade800: const Color(0xff3C2F2F),
        leading: Image.asset(image, ),
        title: CustomText(
          text: title,
          weight: FontWeight.normal,
          color: Colors.white,
        ),
        subtitle: subtitle != null
            ? CustomText(
          text: subtitle,
          weight: FontWeight.normal,
          color: Colors.white,
        )
            : null,
        trailing: Radio<String>(
          activeColor: Colors.white,
          value: value,
          groupValue: selectedPayment,
          onChanged: (v) {
            setState(() {
              selectedPayment = v!;
            });
            widget.onChanged(v!);
          },
        ),
      ),
    );
  }
}
