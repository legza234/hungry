import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.ispassward,
    required this.controller,
    this.keyboardType = TextInputType.text, // Add keyboardType
  });

  final String hint;
  final bool ispassward;
  final TextEditingController controller;
  final TextInputType keyboardType; // Add keyboardType

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.ispassward;
    super.initState();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType, // Use keyboardType
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please fill ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.ispassward
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  color: Colors.white,
                ),
                onPressed: _togglePassword,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.white70),
        fillColor: Colors.white12,
        filled: true,
      ),
    );
  }
}
