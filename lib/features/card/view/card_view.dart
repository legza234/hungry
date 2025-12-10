import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/card/widget/cart__item.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../shared/custom_botton.dart';
import '../../checkout/view/chechout_view.dart';

class CartItemData {
  final String image;
  final String name;
  final String description;
  final double price;
  int quantity;

  CartItemData({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool _isLoading = true;
  String? _error;
  final List<CartItemData> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));

      // Mock data for testing
      final mockItems = [
        CartItemData(
          image: "assets/burg 4.png",
          name: "Hamburger",
          description: "Veggie Burger",
          price: 9.09,
        ),
        CartItemData(
          image: "assets/burg 4.png",
          name: "Double Burger",
          description: "Spicy Burger",
          price: 12.5,
        ),
      ];

      setState(() {
        _cartItems.clear();
        _cartItems.addAll(mockItems);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = "Failed to load cart. Please try again.";
      });
    }
  }

  void _onAdd(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _onMin(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) _cartItems[index].quantity--;
    });
  }

  double _calculateSubtotal() =>
      _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  double _calculateTaxes() => _calculateSubtotal() * 0.1; // 10% tax
  double _calculateFees() => 1.50; // Flat fee
  double _calculateTotal() =>
      _calculateSubtotal() + _calculateTaxes() + _calculateFees();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('My Cart', style: TextStyle(color: AppColor.Primru)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new, color: AppColor.Primru),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(child: _buildBody()),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return  Center(
          child: CircularProgressIndicator(color: AppColor.Primru));
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, style:  TextStyle(color: Colors.red)),
            const Gap(10),
            ElevatedButton(
                onPressed: _fetchCartItems, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_cartItems.isEmpty) {
      return const Center(child: Text('Your cart is empty.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        return CartItem(
          image: item.image,
          text: item.name,
          decs: item.description,
          number: item.quantity,
          onAdd: () => _onAdd(index),
          onMin: () => _onMin(index),
        );
      },
    );
  }

  Widget? _buildBottomSheet() {
    if (_isLoading || _error != null || _cartItems.isEmpty) return null;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: 100,
        child: Row(
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
                  text: "\$${_calculateTotal().toStringAsFixed(2)}",
                  weight: FontWeight.bold,
                  size: 32,
                ),
              ],
            ),
            CustomButton(
              text: "Checkout",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return CheckoutView(
                    subtotal: _calculateSubtotal(),
                    taxes: _calculateTaxes(),
                    fees: _calculateFees(),
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
