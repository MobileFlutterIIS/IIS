import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/screens/Account/AccountPage.dart';

class GradeBookPage extends StatelessWidget{
  final List<GradeBook> gradebook;
  const GradeBookPage({Key? key, required this.gradebook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[200],
        centerTitle: true,
        title: Text('Р Е Й Т И Н Г'),
      ),
    );
  }
}