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
        //obscureText: obsecureText,
        style: const TextStyle(height: 0.6, ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            //borderSide: BorderSide(color: Colors.black),
          ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black),
          // ),
          //fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17, ),
        ),
      ),
    );
  }
}