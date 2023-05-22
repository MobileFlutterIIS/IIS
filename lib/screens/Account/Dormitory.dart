import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';

class Dormitory extends StatefulWidget {
  const Dormitory({Key? key}) : super(key: key);

  @override
  State<Dormitory> createState() => _DormitoryState();
}

class _DormitoryState extends State<Dormitory> {

  static List<DormReq>? dorms = [];
  static List<String>? privs = [];


  Future<bool> initialise() async {
    if (dorms == null || privs == null) {
     dorms = await AccountManager.GetDormReqs();
     privs = await AccountManager.GetPriviliges();
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: initialise(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData && snapshot != null) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Информация о заселении'),
                  Text('Для подачи заявления (бланк можно скачать ниже) Вам нужно обратиться в деканат. '
                      'К заявлению обязательно прилагается справка о составе семьи и, при наличии, документы, подтверждающие льготы.'),
                  ElevatedButton(onPressed: (){}, child: Text('Подать Заявку')),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount:  dorms!.length,
                      itemBuilder: (context, index){
                         return Card(
                           color: dorms![index].status! == "Ожидание"? Colors.orange: Colors.green,
                           child: Row(
                           children: [
                             Text(dorms![index].number!.toString()),
                           ],
                         ),);
                      }
                  ),),
                  Text('Льготы'),
                  Container(
                    height: 200,
                    child: ListView.builder(
                        itemCount:  privs!.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Row(
                              children: [
                                Text(privs![index]),
                              ],
                            ),);
                        }
                    ),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
