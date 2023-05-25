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
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Диплом',
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
      body: Column(
        children: [
          Text('Дипломный проект',
          style: TextStyle(fontFamily: 'NotoSerif', fontSize: 18,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text('Оставить заявку Вы сможете только на выпускном курсе.',
          style: TextStyle(fontFamily: 'NotoSerif',),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){DiplomaReq();}, child: Text("Подать Заявку",
          style: TextStyle(fontFamily: 'NotoSerif',),)),
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
              Text('Оформить заявку на дипломный проект',
              style: TextStyle(fontFamily: 'NotoSerif',),),

            ],
          );
        }
    );
  }
}
