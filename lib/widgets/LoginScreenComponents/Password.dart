import 'package:flutter/material.dart';

class Password extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obsecureText;
  // final Color backgroundcolor;
  // final Color primarycolor;

  const Password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    // required this.backgroundcolor,
    // required this.primarycolor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'NotoSerif',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 16.0),
        ),
      ),
    );
  }
}