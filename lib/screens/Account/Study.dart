import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:intl/intl.dart';

class StudyPage extends StatefulWidget {
  final List<Certificate> certificate;
  final List<MarkSheet> marksheet;
  const StudyPage({Key? key,required this.certificate,required this.marksheet}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {

  ///
  /// TODO
  /// 1) Ведомостички ето прекол конечна, пока что там пуста ВСЕГДА
  /// 2) Обновить списки после заявок
  /// 3) добавить отмену справки
  /// 4) долги и доты
  ///
  /// +
  ///
  /// тут немного RoflanEbalo по коду (да вот прям под этим комментом)
  ///
  static List<Certificate>? certificates ;
  static List<MarkSheet>? marksheets;

  Future<void> updateCertificates () async
  {
    final newcerts = (await AccountManager.UserCetificate());
   //marksheets = (await AccountManager.UserMarkSheets());
    setState(() {
      certificates = newcerts;
    });
  }

  @override
  void initState() {
   certificates = widget.certificate;
   marksheets = widget.marksheet ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: const [
              Text(
                'Учеба',
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
      body: SingleChildScrollView(
      child: Container(
        child: Column
          (
          children: [
            //const SizedBox(height: 40,),
            Column(
              children: [
                const SizedBox(height: 30,),
                const Text(
                    'Ведомостички',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5,),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return OrderMarksheet();
                          }
                      ).then((_) => updateCertificates());
                    },
                    child: const Text(
                        'Заказать ведомостичку',
                      style: TextStyle(
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                  // style: ButtonStyle(
                  //   // backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  //   //       (Set<MaterialState> states) {
                  //   //     if (states.contains(MaterialState.pressed)) {
                  //   //       return Colors.blueAccent.withOpacity(0.5);
                  //   //     }
                  //   //     return Color.fromRGBO(51, 40, 32, 0.9);
                  //   //   },
                  //   // ),
                  // ),
                ),
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
                          itemCount: marksheets!.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context,index)
                          {
                            return Container(
                              child: Card(
                                color: (marksheets![index].status! == 'напечатана'? const Color.fromRGBO(148, 166, 119, 0.9) : const Color.fromRGBO(255, 255, 255, 0.9)),
                                elevation: 0.0,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Text('Дата Создания ${marksheets![index].createDate!}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),),
                                      const SizedBox(height: 5,),
                                      Text('Предмет ${marksheets![index].subject!.abbrev!}'
                                          '(${marksheets![index].subject!.lessonTypeAbbrev!})'
                                          '${marksheets![index].subject!.term} семестр',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),),
                                      const SizedBox(height: 5,),
                                      Text('Преподаватель ${marksheets![index].employee!.fio!}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),),
                                      const SizedBox(height: 5,),
                                      ///
                                      /// TODO
                                      ///
                                      marksheets![index].absentDate != null?
                                      Text(
                                      'Дата пропуска ${marksheets![index].employee!.fio!}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),    ): SizedBox(),
                                      const SizedBox(height: 5,),
                                      Text('Статус ${marksheets![index].status!}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),),
                                      const SizedBox(height: 5,),
                                      marksheets![index].rejectionReason != null?
                                      Text(
                                          'Причина отказа ${marksheets![index].rejectionReason!}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),): SizedBox(),
                                      const SizedBox(height: 5,),
                                      marksheets![index].price != null?
                                      Text(
                                          'Цена ${marksheets![index].price}',
                                      style: const TextStyle(fontFamily: 'NotoSerif',),): SizedBox(),
                                    ],
                                  ),
                                ) ,
                              ),
                            );
                          }
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Column(
              children: [
                const Text(
                    'Справки',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                    //color: Color.fromRGBO(51, 40, 32, 0.9),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return OrderCertificate();
                                }
                            ).then((_) => updateCertificates());
                    },
                    child: const Text('Заказать справку',
                    style: TextStyle(fontFamily: 'NotoSerif',),),
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  //         (Set<MaterialState> states) {
                  //       if (states.contains(MaterialState.pressed)) {
                  //         return Colors.blueAccent.withOpacity(0.5);
                  //       }
                  //       return Color.fromRGBO(51, 40, 32, 0.9);
                  //     },
                  //   ),
                  // ),
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
                      itemCount: certificates!.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context,index)
                      {
                        return Container(
                          child: Card(
                            color: (certificates![index].status! == 1? Colors.green : certificates![index].status! == 2? Colors.yellow: Colors.red),
                            elevation: 0.0,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(height: 10,),
                                   Text('Дата заказа ${certificates![index].dateOrder!}',
                                   style: const TextStyle(fontFamily: 'NotoSerif',),),
                                   const SizedBox(height: 5,),
                                   Text('Место предъявления ${certificates![index].provisionPlace!}',
                                   style: const TextStyle(fontFamily: 'NotoSerif',),),
                                   ///
                                  /// хз какие статусы имеются, надо искать докум
                                  ///
                                   const SizedBox(height: 5,),
                                   Text('${certificates![index].rejectionReason != null? 'Причина отказа ${certificates![index].rejectionReason!}' : ''}',
                                   style: const TextStyle(fontFamily: 'NotoSerif',),),
                                   const SizedBox(height: 5,),
                                  certificates![index].status! == 2? IconButton(onPressed: () async{
                                    AccountManager.RemoveCertificate(certificates![index].id!);
                                    updateCertificates();
                                   }, icon: const Icon(Icons.highlight_remove_outlined)):Text('Статус ${certificates![index].status == 1? "Напечатана" : "Отменена"}',
                                  style: const TextStyle(fontFamily: 'NotoSerif',),),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                            ) ,
                          ),
                        );
                      }
                  )
              ),
                ),
              ]
            ),
            const SizedBox(height: 30,),
            ///
            /// dva placeholdera
            ///
            const Text(
              'Заявки DOT',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold
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

              const SizedBox(height: 30,),
              // Container(
              //   child: Text(
              //     'Задолженности в библиотеке',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: 'NotoSerif',
              //     ),
              //   ),
              // ),
          ],
        ),
      ),
      ));
  }
}

///
///
///  ЗАКАЗ СПРАВКИ
///
///
class OrderCertificate extends StatefulWidget {
  const OrderCertificate({Key? key}) : super(key: key);

  @override
  State<OrderCertificate> createState() => _OrderCertificateState();
}

class _OrderCertificateState extends State<OrderCertificate> {

  List<String> types = ['обычная','гербовая'];
  String? Typevalue = 'обычная';
  TextEditingController Commentcontroller = TextEditingController();
  int spinvalue = 1;
  //String? Comentvalue = '';
  static List<PlaceType>? places;
  Place? Placevalue;

  Future<bool> initplaces ( ) async
  {
    if ( places == null || places!.isEmpty )
   places = await AccountManager.GetPlaces();
   logger.d(places);
   return true;
  }

  /// return null
  /// TODO
  ///

  List<DropdownMenuItem<Place>> createlistplaces ()
  {
   List<DropdownMenuItem<Place>> list = [];
    var remba = "";
    places!.forEach((element) {
      if (element.type != remba) {
        remba = element!.type!;
        list.add(DropdownMenuItem<Place>(child: Row(children:
        [Text(element!.type!,style: TextStyle(fontSize: 10, fontFamily: 'NotoSerif',),),Expanded(child: Divider(color: Colors.black,))]),
            enabled: false, value: null));
      }
      element!.places!.forEach((ele) {
        list.add(DropdownMenuItem<Place>(child: Text(ele!.name!,style: TextStyle(fontFamily: 'NotoSerif',),), value: ele,));
      });
    });
    return list;
  }

  @override
  void initState() {
    initplaces ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: initplaces ( ),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData && snapshot != null)
            return CircularProgressIndicator();
          bool enabled;
          if (Placevalue !=null && Placevalue!.type! ==0) {
            enabled = true;
            Typevalue = 'обычная';
            Commentcontroller.clear();
          }
          else {
            enabled = false;
            Typevalue = 'гербовая';
            Commentcontroller.clear();
          }
          return AlertDialog(
            //backgroundColor: Colors.grey[900],
            scrollable: true,
            content:
            Column
              (
              children: <Widget>[
                const Text('Тип печати', style: TextStyle(fontFamily: 'NotoSerif',),),
                DropdownButton<String>(
                    hint: const Text(
                      'Тип печати',
                      style: TextStyle(fontFamily: 'NotoSerif',),
                    ),
                    items: types.map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                        style: const TextStyle(fontFamily: 'NotoSerif',),),
                      );
                    }).toList(),
                    value: Typevalue,
                    onChanged: enabled? (value) {
                      setState(() {
                        Typevalue = value;
                      });
                    }: null,),
                RichText(text: TextSpan (text: 'Место предъявления',style: TextStyle(fontFamily: 'NotoSerif',),children:
                [
                  TextSpan(text: '*',style: TextStyle(fontFamily: 'NotoSerif',)),
                ])),
                DropdownButton<Place>(
                  isExpanded: true,
                    hint: const Text(
                      'Вебырите место',
                      style: TextStyle(fontFamily: 'NotoSerif',),
                    ),
                    items: createlistplaces(),
                    value: Placevalue,
                    onChanged: (value) {
                      setState(() {
                        Placevalue = value;
                      });
                    }),
               const Text('Комментарий', style: TextStyle(fontFamily: 'NotoSerif',),),
               TextField(enabled: enabled,decoration: new InputDecoration.collapsed(
                   hintText: 'Оставьте комментарий'
               ),controller: Commentcontroller,),
               const Text('Количество справок', style: TextStyle(fontFamily: 'NotoSerif',),),
                SpinBox(
                  min: 1,
                  max: 20,
                  value: 1,
                  onChanged: (value) =>  setState(() {
                    spinvalue = value.toInt();
                  }),
                ),
                ///
                /// TODO
                /// Аккуратнее со стилями текста тут
                ///
                RichText(text: TextSpan(text: 'Правила заказа\n',
                    style: TextStyle(fontSize: 20,fontFamily: 'NotoSerif',),
                  children: [
                    TextSpan(text: '1. Если Вы не знаете, какой тип печати нужен на справке, или Вам не нужна '
                        'гербовая печать, выбирайте тип печати ',style: TextStyle(fontSize: 15,fontFamily: 'NotoSerif',)),
                    TextSpan(text: '«обычная».\n', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'NotoSerif',),),
                    TextSpan(text: '2. Место предъявления ',style: TextStyle(fontSize: 15,fontFamily: 'NotoSerif',)),
                    TextSpan(text: '«иное» ', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'NotoSerif',),),
                    TextSpan(text: 'выбирайте только в том случае, если подходящий по смыслу вариант отсутствует в списке предложенных. '
                        'При этом в комментарии обязательно укажите нужное Вам место предъявления. '
                        'Справки «по месту требования» не выдаются – ',style: TextStyle(fontSize: 15,fontFamily: 'NotoSerif',)),
                    TextSpan(text: 'указывайте конкретное место.', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'NotoSerif',),),
                  ]
                ),),
                ElevatedButton(
                    onPressed: Placevalue != null ? () async{
                 var str = await AccountManager.SentCertificateRequest(spinvalue, Typevalue!, Placevalue!.name!, Commentcontroller.value.text);
                 logger.d(str);
                }
                : null,
                    child: const Text('Заказать', style: TextStyle(fontFamily: 'NotoSerif',),),
                ),
              ],
            ),
          );
        }
      );
    }

}

class OrderMarksheet extends StatefulWidget {
  const OrderMarksheet({Key? key}) : super(key: key);

  @override
  State<OrderMarksheet> createState() => _OrderMarksheetState();
}

class _OrderMarksheetState extends State<OrderMarksheet> {

  TextEditingController datec = TextEditingController();

  List<Mentor>? mentors ;
  List<Subj>? subjs ;
  List<LessonType> types =[];
  List<LessonType>? examples;


  Subj? Chosensubj;
  Mentor? Chosenmentro;
  LessonType? Chosentype;
  DateTime? Chosendate;

  Future<bool> initplaces ( ) async
  {
    examples = await AccountManager.GetTypes();
    if ( subjs == null || subjs!.isEmpty )
      subjs = await AccountManager.GetSubjects();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initplaces(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
        if (!snapshot.hasData && snapshot != null)
          return CircularProgressIndicator();
        return AlertDialog(
        //backgroundColor: Colors.grey[900],
        scrollable: true,
        content:
        Column
          (
          children: <Widget>[
            const Text('Дисциплина', style: TextStyle(fontFamily: 'NotoSerif',),),
            DropdownButton<Subj>(
                isExpanded: true,
                hint: const Text(
                  'Вебырите предмет',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                  ),
                ),
                items: subjs!.map<DropdownMenuItem<Subj>>((
                    Subj? value) {
                  return DropdownMenuItem<Subj>(
                    value: value,
                    child: Text(value!.abbrev!+ '(' + value!.term!.toString() + ' семестр)',
                    style: const TextStyle(fontFamily: 'NotoSerif',),),
                  );
                }).toList(),
                value: Chosensubj,
                onChanged: (value) {
                  setState(() {
                    Chosensubj = value;
                    types.clear();
                    types!.addAll(Chosensubj!.lessonTypes!);
                  });
                }),
            const Text('Тип', style: TextStyle(fontFamily: 'NotoSerif',),),
            DropdownButton<LessonType>(
                isExpanded: true,
                hint: const Text(
                  'Вебырите Тип',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                  ),
                ),
                items: types!.map<DropdownMenuItem<LessonType>>((
                    LessonType? value) {
                  return DropdownMenuItem<LessonType>(
                    value: value,
                    child: Text(value!.abbrev!,
                    style: const TextStyle(fontFamily: 'NotoSerif',),),
                  );
                }).toList(),
                value: Chosentype,
                onChanged: types.isEmpty? null :(value) {
                  setState(() {
                    Chosentype = value;
                  });
                }),
            Autocomplete<Mentor>(
              displayStringForOption: (Mentor option) => option.fio!,
              optionsBuilder:(TextEditingValue textEditingValue) async
              {
                List<Mentor>? list = await AccountManager.GetMentors(textEditingValue.text);
                logger.d(list);
                return list!;
              },
              onSelected: (Mentor a)
              {
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {
                  Chosenmentro = a;
                });
              },
            ),
            Container(
              child: Row(
                children: [
                  IconButton(icon: const Icon(Icons.calendar_month),onPressed: () async{
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );
                    if ( pickedDate!= null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        datec.text = formattedDate;
                        Chosendate = pickedDate;
                      });
                    }
                  }
                  ),
                  Text(Chosendate == null? 'Выберети дату' : datec.text),
                  ElevatedButton(onPressed: (Chosendate == null || Chosenmentro == null || Chosensubj == null || Chosentype == null) ? null :(){}, child: Text('Заказать')),
                  (Chosendate == null || Chosenmentro == null || Chosensubj == null || Chosentype == null) ? SizedBox():showInfo(),
                ],
              ),
            )
          ],
        ),
      );
      }
    );
  }

  ///
  /// TODO
  /// Dodelat
  ///

  Text showInfo()
  {
    String inp ='';
    LessonType? temp;
    examples!.forEach((element) {if (element.shortName!.contains(Chosentype!.abbrev!)) {inp = element.fullName!; temp = element; }});
    String inp2 = temp!.coefficient!.toStringAsFixed(2) + ' ч * ' + Chosentype!.price!.toStringAsFixed(2) +
        ' руб./ч = ' + (Chosentype!.price!*temp!.coefficient!).toStringAsFixed(2) + ' руб.';
    return Text('asd');
  }
}

