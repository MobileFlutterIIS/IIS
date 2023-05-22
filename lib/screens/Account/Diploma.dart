import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';

class Diploma extends StatelessWidget {
  const Diploma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text('Дипломный проект'),
          Text('Оставить заявку Вы сможете только на выпускном курсе.'),
          ElevatedButton(onPressed: (){DiplomaReq();}, child: Text("Подать Заявку")),
          SizedBox(height: 10,),
          // Text('Производственная практика'),
          // ElevatedButton(onPressed: (){}, child: Text("Подать Заявку")),
        ],
      ),
    ));
  }
}

class DiplomaReq extends StatefulWidget {
  const DiplomaReq({Key? key}) : super(key: key);

  @override
  State<DiplomaReq> createState() => _DiplomaReqState();
}

class _DiplomaReqState extends State<DiplomaReq> {

  List<String> hints = [];
  List<String> topics = [];

  Future<bool> initplaces ( ) async
  {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initplaces(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Column(
            children: [
              Text('Оформить заявку на дипломный проект'),

            ],
          );
        }
    );
  }
}
