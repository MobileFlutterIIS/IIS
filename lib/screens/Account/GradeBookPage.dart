import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';

class GradeBookPage extends StatelessWidget{
  final List<GradeBook> gradebook;
  const GradeBookPage({Key? key, required this.gradebook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gradebook[0].student!.fio.toString()),
      ),
    );
  }
}