import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  final nameController;
  final String nameHintText;
  final bool nameObsecureText;
  final Color backgroundcolor;
  final Color primarycolor;

  const UserName({
    super.key,
    required this.nameController,
    required this.nameHintText,
    required this.nameObsecureText,
    required this.backgroundcolor,
    required this.primarycolor,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nameController,
        obscureText: nameObsecureText,
        style: TextStyle(height: 0.6, color: primarycolor),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: primarycolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primarycolor),
          ),
          fillColor: backgroundcolor,
          filled: true,
          hintText: nameHintText,
          hintStyle: TextStyle(fontSize: 17, color: primarycolor),
        ),
      ),
    );
  }
}