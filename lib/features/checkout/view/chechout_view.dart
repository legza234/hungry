import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widget/order_details_widget.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/checkout/widget/payment_method_selector.dart';
import 'package:hungry/root.dart';

import '../../../shared/custom_botton.dart';
import '../../orderHistory/view/order_history_view.dart';

class CheckoutView extends StatefulWidget {
  final double subtotal;
  final double taxes;
  final double fees;

  const CheckoutView({
    super.key,
    required this.subtotal,
    required this.taxes,
    required this.fees,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  bool _isLoading = false;
  String _selectedPaymentMethod = "cash";

  double get total => widget.subtotal + widget.taxes + widget.fees;

  Future<void> _processPayment() async {
    setState(() => _isLoading = true);

    try {
      if (_selectedPaymentMethod == "visa") {
        // here open visa payment page
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const VisaPaymentPage()),
        );
        setState(() => _isLoading = false);
        return;
      }

      // CASH OR OTHER METHODS
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Payment successful!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const Root()),
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Payment failed. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(color: AppColor.Primru)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.Primru),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Order summary",
              weight: FontWeight.bold,
              size: 20,
            ),
            const Gap(20),
            OrderDetailsWidget(
              order: widget.subtotal.toStringAsFixed(2),
              taxes: widget.taxes.toStringAsFixed(2),
              fees: widget.fees.toStringAsFixed(2),
              total: total.toStringAsFixed(2),
            ),
            const Gap(20),
            const CustomText(
              text: "Payment methods",
              weight: FontWeight.bold,
              size: 20,
            ),
            const Gap(20),
            PaymentMethodSelector(
              initialValue: _selectedPaymentMethod,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedPaymentMethod = value);
                }
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Total",
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                    CustomText(
                      text: "\$${total.toStringAsFixed(2)}",
                      weight: FontWeight.bold,
                      size: 32,
                    ),
                  ],
                ),
                _isLoading
                    ? SizedBox(
                        height: 50,
                        width: 150,
                        child: Center(
                          child: CircularProgressIndicator(color: AppColor.Primru),
                        ),
                      )
                    : CustomButton(
                        text: "Pay Now",
                        onTap: _processPayment,
                      ),
              ],
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

// Placeholder for VisaPaymentPage
class VisaPaymentPage extends StatelessWidget {
  const VisaPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visa Payment')),
      body: const Center(child: Text('Visa Payment Page')),
    );
  }
}
