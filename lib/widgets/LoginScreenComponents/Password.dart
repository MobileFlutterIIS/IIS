import 'package:flutter/material.dart';

class Password extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obsecureText;

  const Password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(height: 0.6),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(22, 49, 99, 0.9)),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17, color: Colors.grey[400]),
        ),
      ),
    );
  }
}