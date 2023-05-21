import 'package:flutter/material.dart';

class AdditionalFunctions extends StatelessWidget{
  AdditionalFunctions({
    super.key,
});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
      leadingWidth: MediaQuery.of(context).size.width * 0.046,
      title: Row(
        children: const [
          Text(
            'Настройки',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'NotoSerif',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.black, // Цвет иконки
      ),
    ),
  );
}