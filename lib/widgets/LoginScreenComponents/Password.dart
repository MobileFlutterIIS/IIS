import 'package:flutter/material.dart';

class Password extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obsecureText;
  final Color backgroundcolor;
  final Color primarycolor;

  const Password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.backgroundcolor,
    required this.primarycolor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(height: 0.6, color: primarycolor),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: primarycolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primarycolor),
          ),
          fillColor: backgroundcolor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17, color: primarycolor),
        ),
      ),
    );
  }
}