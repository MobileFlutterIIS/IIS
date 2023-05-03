import 'package:flutter/material.dart';

class Phonebook extends StatelessWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  Phonebook({
    super.key,
    required this.backgroundcolor,
    required this.primarycolor
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: backgroundcolor,
    body: Text(
      'Номера',
      style: TextStyle(
        color: primarycolor,
      ),
    ),
  );
}