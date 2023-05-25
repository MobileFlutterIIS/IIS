import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';

class Penalties extends StatelessWidget {
  final List<String> penalties;
  const Penalties({Key? key, required this.penalties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Взыскания',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        // iconTheme: const IconThemeData(
        //   color: Colors.black, // Цвет иконки
        // ),
      ),
      body: Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: penalties.length !=0 ?ListView.builder(
          itemCount: penalties.length,
             itemBuilder: (context,index) {
              return Card(child: Text(penalties[index],
              style: TextStyle(fontFamily: 'NotoSerif',),),);
            }
        ): Center(child: const Icon(Icons.error_outline_rounded))),
      ],
    ) ,),));
  }
}
