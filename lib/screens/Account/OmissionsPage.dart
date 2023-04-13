import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';

class OmissionsPage extends StatelessWidget{
  final List<Omission> omissions;
  const OmissionsPage({Key? key, required this.omissions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пропуски'),
      ),
    );
  }
}