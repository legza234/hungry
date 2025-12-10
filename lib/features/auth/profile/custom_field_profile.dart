import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFieldProfile extends StatelessWidget {
  const CustomFieldProfile(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller ;
  final String label ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration:  InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),

          )
      ),
    );
  }
}
