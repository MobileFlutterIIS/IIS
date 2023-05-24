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
    return SafeArea(child: Scaffold(body: Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Взыскания'),
        Expanded(child: penalties.length !=0 ?ListView.builder(
          itemCount: penalties.length,
             itemBuilder: (context,index) {
              return Card(child: Text(penalties[index]),);
            }
        ): Center(child: Icon(Icons.error_outline_rounded))),
      ],
    ) ,),));
  }
}
