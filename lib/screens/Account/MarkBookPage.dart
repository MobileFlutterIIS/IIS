import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';

class MarkBookPage extends StatelessWidget {
  final MarkBook markBook;
  const MarkBookPage({Key? key, required this.markBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(markBook.averageMark!.toString()),
      ),
    );
  }
}