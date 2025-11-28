import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;

class CustomText extends StatelessWidget {
  const CustomText({super.key,  required this.text,  this.color,  required this.Weight,  this.size, });

  final String text;
  final Color? color;
  final FontWeight Weight ;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: Weight,
      ),
    );
  }
}
