import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: AppColor.Primru,
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColor.Primru,
              width: 1.5,
            ),
          ),

          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
        ),
      ),
    );

  }
}
