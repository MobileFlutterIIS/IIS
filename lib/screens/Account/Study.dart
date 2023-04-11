import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';

class StudyPage extends StatelessWidget {
  final List<Certificate> certificate;
  const StudyPage({Key? key,required this.certificate}) : super(key: key);

  ///
  /// Ведомостички ето прекол конечна, пока что там пуста ВСЕГДА
  ///


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //child: SingleChildScrollView(
      child: Container(
        child: Column
          (
          children: [
            Container(
              height: 100,
              child: Column(
                children: [
                  Text('Ведомостички'),
                  ElevatedButton(onPressed: () {}, child: Text('Заказать ведомостичку')),
                  // Container(
                  //     height: 200,
                  //     color: Colors.grey,
                  //     child: ListView.builder(
                  //       //physics: NeverScrollableScrollPhysics(),
                  //         itemCount: certificate.length,
                  //         padding: const EdgeInsets.all(8),
                  //         itemBuilder: (context,index)
                  //         {
                  //           return Container(
                  //             child: Card(
                  //               color: (certificate[index].status! == 1? Colors.green : Colors.redAccent),
                  //               elevation: 4,
                  //               shape: const RoundedRectangleBorder(
                  //                 side: BorderSide(
                  //                   color: Colors.black12,
                  //                 ),
                  //                 borderRadius: const BorderRadius.all(Radius.circular(12)),
                  //               ),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Text('Дата заказа ${certificate[index].dateOrder!}'),
                  //                   Text('Место предъявления ${certificate[index].provisionPlace!}'),
                  //                   ///
                  //                   /// хз какие статусы имеются, надо искать докум
                  //                   ///
                  //                   Text('Статус ${certificate[index].status!}'),
                  //                   Text('${certificate[index].rejectionReason != null? 'Причина отказа ${certificate[index].rejectionReason!}' : ''}'),
                  //                 ],
                  //               ) ,
                  //             ),
                  //           );
                  //         }
                  //     )
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text('Справки'),
                ElevatedButton(onPressed: () {}, child: Text('Заказать ведомостичку')),
                Container(
                height: 200,
                color: Colors.grey,
                child: ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                    itemCount: certificate.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context,index)
                    {
                      return Container(
                        child: Card(
                          color: (certificate[index].status! == 1? Colors.green : Colors.redAccent),
                          elevation: 4,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Text('Дата заказа ${certificate[index].dateOrder!}'),
                               Text('Место предъявления ${certificate[index].provisionPlace!}'),
                               ///
                              /// хз какие статусы имеются, надо искать докум
                              ///
                               Text('Статус ${certificate[index].status!}'),
                               Text('${certificate[index].rejectionReason != null? 'Причина отказа ${certificate[index].rejectionReason!}' : ''}'),
                            ],
                          ) ,
                        ),
                      );
                    }
                )
              ),]
            ),
            SizedBox(height: 5,),
            ///
            /// dva placeholdera
            ///
            Container(
              child: Text('DOT'),
            ),
              SizedBox(height: 5,),
              Container(
                child: Text('LIB'),
              ),
          ],
        ),
      ),
    );
  }
}
