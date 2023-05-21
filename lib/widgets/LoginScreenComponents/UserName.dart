import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  final nameController;
  final String nameHintText;
  final bool nameObsecureText;
  // final Color backgroundcolor;
  // final Color primarycolor;

  const UserName({
    super.key,
    required this.nameController,
    required this.nameHintText,
    required this.nameObsecureText,
    // required this.backgroundcolor,
    // required this.primarycolor,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nameController,
        obscureText: nameObsecureText,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'NotoSerif',
        ),
        decoration: InputDecoration(
          hintText: nameHintText,
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