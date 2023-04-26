import 'package:flutter/material.dart';

class ScheduleDepartment extends StatelessWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  ScheduleDepartment({
    super.key,
    required this.backgroundcolor,
    required this.primarycolor
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: backgroundcolor,
    body: Text(
      'Расписания кафедры',
      style: TextStyle(
        color: primarycolor,
      ),
    ),
  );
}