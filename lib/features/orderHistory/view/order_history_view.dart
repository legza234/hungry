import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_botton.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/Custom_botton.dart';
import '../../../shared/custom_text.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  bool _isLoading = true;
  String? _error;
  final List<Map<String, String>> _orders = [];

  @override
  void initState() {
    super.initState();
    _fetchOrderHistory();
  }

  Future<void> _fetchOrderHistory() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Simulate network call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call
      // For demonstration, we'll add some mock data.
      final mockOrders = [
        {
          "name": "Hamburger",
          "quantity": "2",
          "price": "20",
          "image": "assets/burg 4.png"
        },
        {
          "name": "Pizza",
          "quantity": "1",
          "price": "30",
          "image": "assets/burg 4.png"
        },
      ];

      setState(() {
        _orders.addAll(mockOrders);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = "Failed to load order history. Please try again.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Order History', style: TextStyle(color: AppColor.Primru)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new, color: AppColor.Primru),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return  Center(child: CircularProgressIndicator(color: AppColor.Primru));
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _fetchOrderHistory, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_orders.isEmpty) {
      return const Center(child: Text('You have no past orders.'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(order['image']!, width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: order['name']!, weight: FontWeight.bold),
                      CustomText(text: "QTY: X${order['quantity']!}", weight: FontWeight.normal),
                      CustomText(text: "Price: ${order['price']!}", weight: FontWeight.normal),
                    ],
                  ),
                  CustomBotton(text: "Re-Order"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
