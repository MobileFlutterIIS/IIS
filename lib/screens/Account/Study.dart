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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[200],
        centerTitle: true,
        title: Text('У Ч Е Б А'),
      ),
      body: Container(
        //child: SingleChildScrollView(
        child: Container(
          child: Column
            (
            children: [
              const SizedBox(height: 40,),
              Container(
                height: 120,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                        'Ведомостички',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(51, 40, 32, 0.9),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text('Заказать ведомостичку'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blueAccent.withOpacity(0.5);
                            }
                            return Color.fromRGBO(51, 40, 32, 0.9);
                          },
                        ),
                      ),
                    ),
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
              SizedBox(height: 30,),
              Column(
                children: [
                  Text(
                      'Справки',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(51, 40, 32, 0.9),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Заказать справку'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          return Color.fromRGBO(51, 40, 32, 0.9);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                    height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                    child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: certificate.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context,index)
                        {
                          return Container(
                            child: Card(
                              color: (certificate[index].status! == 1? Color.fromRGBO(148, 166, 119, 0.9) : Color.fromRGBO(172, 118, 116, 0.9)),
                              elevation: 0.0,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(height: 10,),
                                     Text('Дата заказа ${certificate[index].dateOrder!}'),
                                     const SizedBox(height: 5,),
                                     Text('Место предъявления ${certificate[index].provisionPlace!}'),
                                     ///
                                    /// хз какие статусы имеются, надо искать докум
                                    ///
                                     const SizedBox(height: 5,),
                                     Text('Статус ${certificate[index].status!}'),
                                     const SizedBox(height: 5,),
                                     Text('${certificate[index].rejectionReason != null? 'Причина отказа ${certificate[index].rejectionReason!}' : ''}'),
                                  ],
                                ),
                              ) ,
                            ),
                          );
                        }
                    )
                ),
                  ),]
              ),
              const SizedBox(height: 30,),
              ///
              /// dva placeholdera
              ///
              Text(
                'Заявки DOT',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(51, 40, 32, 0.9),
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
                SizedBox(height: 30,),
                Container(
                  child: Text(
                    'Задолженности в библиотеке',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(51, 40, 32, 0.9),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
