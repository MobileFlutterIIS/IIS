import 'package:flutter/material.dart';

class AdditionalFunctions extends StatelessWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  AdditionalFunctions({
    super.key,
    required this.backgroundcolor,
    required this.primarycolor
});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: backgroundcolor,
    body: Text(
        'Доп',
      style: TextStyle(
        color: primarycolor,
      ),
    ),
  );
}