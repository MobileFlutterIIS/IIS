import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  final nameController;
  final String nameHintText;
  final bool nameObsecureText;

  const UserName({
    super.key,
    required this.nameController,
    required this.nameHintText,
    required this.nameObsecureText,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: nameController,
        obscureText: nameObsecureText,
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
          hintText: nameHintText,
          hintStyle: TextStyle(fontSize: 17, color: Colors.grey[400]),
        ),
      ),
    );
  }
}