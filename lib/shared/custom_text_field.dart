import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  const CustomTextField({super.key, required this.hint, required this.ispassward, required this.controller});

  final String hint;
  final bool ispassward;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

@override
  void initState() {
  _obscureText =widget.ispassward;
    super.initState();
  }
void _togglePassward(){
  setState(() {
    _obscureText =!_obscureText;
  });
}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
          color: Colors.white
      ),
      cursorColor: Colors.black,
      validator: (v){
        if (v ==null || v.isEmpty){
         return 'please fill ${widget.hint}';
        }
        null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon:
        widget.ispassward?
        GestureDetector(
            onTap: _togglePassward,


            child: Icon(CupertinoIcons.eye,color: Colors.white,)):null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white12,
        filled: true,
      ),
    );
  }
}
