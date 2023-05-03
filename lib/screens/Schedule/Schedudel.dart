import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger =Logger ();

class Schedule extends StatefulWidget {
  ScheduleInfo whattobuild;
  Schedule(this.whattobuild, {Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  DateTime now = new DateTime.now() ;
  List<DateTime> days20 = [];
  String chosenschedule = '';

  void initdays20()
  {
    days20.add(now);
    DateTime temp = now;
    for (int i =0 ; i < 19; i++)
      {
        temp = temp.add(Duration(days: 1));
        days20.add(temp);
        logger.d(days20[i]);
      }
  }


  @override
  void initState() {
    now = DateTime.now();
    ///
    /// FIX LATER VERY IMPORTANT
    ///
    initdays20();
    logger.v (widget.whattobuild);
    //ManagerClass.getGroupsScheduleToBase('253502');
    //tempfunc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScheduleInfo? _schedule = widget.whattobuild;
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: ListView.builder(
            itemCount: 20,
              itemBuilder: (context,index) {
                return Container(
                  //child: Text('btbt'),
                  child: ScheduleForDay(context,days20[index],_schedule!)
                );
              }
      ),
        ),
    );
  }
}

int numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}

int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  int woy =  ((dayOfYear - date.weekday + 10) / 7).floor();
  if (woy < 1) {
    woy = numOfWeeks(date.year - 1);
  } else if (woy > numOfWeeks(date.year)) {
    woy = 1;
  }
  return woy;
}



Widget ScheduleForDay(BuildContext context, DateTime day, ScheduleInfo schedule)
{
  ///
  ///  CHECK FOR CORRECTNESS, CAN GET FROM NET
  ///
  int? week = (weekNumber(day)+1)%4+1;
  int weekday = day.weekday-1;
  List<ScheduleDay?>? dayofweek;
  String Stringdayofweek;
  switch (weekday)
  {
    case 0 :  dayofweek =schedule!.schedules!.Monday; Stringdayofweek = "Понедельник"; break;
    case 1 :  dayofweek =schedule!.schedules!.Tuesday;Stringdayofweek = "Вторник"; break;
    case 2 :  dayofweek =schedule!.schedules!.Wednesday;Stringdayofweek = "Среда"; break;
    case 3 :  dayofweek =schedule!.schedules!.Thursday;Stringdayofweek = "Четверг"; break;
    case 4 :  dayofweek =schedule!.schedules!.Friday; Stringdayofweek = "Пятница";break;
    case 5 :  dayofweek =schedule!.schedules!.Saturday; Stringdayofweek = "Суббота";break;
    default:  dayofweek = []; Stringdayofweek = "Воскресенье"; break;
  }

  List<ScheduleDay> scheduleitself =[];
  if (dayofweek != null)
  dayofweek!.forEach((element) {
    //logger.d("${element!.startLessonDate} ${element!.endLessonDate} ${element} ${element!.weekNumber}");
    if((element!.startLessonDate == null || element!.endLessonDate == null) || (DateFormat('dd.MM.yy').parse(element!.startLessonDate!).isBefore(day) &&DateFormat('dd.MM.yy').parse(element!.endLessonDate!).isAfter(day)
    && (element!.weekNumber == null|| element!.weekNumber!.contains(week))))
      {
        scheduleitself.add(element);
      }
  });

  if (scheduleitself.isNotEmpty) {
    return Column(
      children: [
        Row(
            children: <Widget>[
              Expanded(child: Divider()),
              Text("${Stringdayofweek}", style: TextStyle(color: Colors.white, fontSize: 20),),
              Text(" ${day.day}.${day.month.toInt()<10?'0': ''}${day.month}", style: TextStyle(color: Colors.white, fontSize: 20),),
              Expanded(child: Divider()),
            ]
        ),

        Container(
          child: ListView.builder(
             physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: scheduleitself.length ,
              itemBuilder: (context, index) {
                return Container(
                  child:  Card(
                    color: Colors.black12,
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(scheduleitself![index].startLessonTime!,style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(scheduleitself![index].endLessonTime!.toString(),style: TextStyle(color: Colors.white,fontSize: 15),)
                          ],
                        ),
                        SizedBox(width: 5,),
                       Container(
                            decoration: BoxDecoration(
                              color: (scheduleitself![index].lessonTypeAbbrev == null ? Colors.white : (scheduleitself![index].lessonTypeAbbrev! == "ЛР"? Colors.red :
                              (scheduleitself![index].lessonTypeAbbrev! == "ЛК"? Colors.green : Colors.yellow))),
                              borderRadius: BorderRadius.circular(8),
                              ),
                              width: 10,
                              height: 80,
                            //color: scheduleitself![index].lessonTypeAbbrev! == "ЛР"? Colors.red :(scheduleitself![index].lessonTypeAbbrev! == "Лk"? Colors.green : Colors.yellow),
                       ),
                        SizedBox(width: 5,),
                        Container(
                          width: 100,
                          height: 85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(scheduleitself![index].subject != null ? scheduleitself![index].subject! : "PLACEHOLDER" ,style: TextStyle(color: Colors.white,fontSize: 20),),
                              Text(scheduleitself![index].auditories!.toString(),style: TextStyle(color: Colors.white,fontSize: 15),)
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Spacer(),
                        Container(
                          width: 100,
                          height: 85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(scheduleitself![index].weekNumber !=  null ? scheduleitself![index].weekNumber!.toString() : "ALL WEEKS",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ///
                              /// BE CAREFUL HERE        |          |   getfio(scheduleitself[index])
                              ///
                              Text(  ' '  ,style: TextStyle(color: Colors.white,fontSize: 10),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
  else
    {
      ///PLACEHOLDER
      return Column(
          children: [
           Row(
          children: <Widget>[
              Expanded(child: Divider()),
              Text("${Stringdayofweek}", style: TextStyle(color: Colors.white, fontSize: 20),),
              Text(" ${day.day}.${day.month.toInt()<10?'0': ''}${day.month}", style: TextStyle(color: Colors.white, fontSize: 20),),
              Expanded(child: Divider()),
            ]
            ),
        Container(
          height: 30,
        child:
        Card (color: Colors.black12,
          elevation: 4,
          child: Text('Нет Занятий в этот день', style: TextStyle(color: Colors.white,fontSize: 20),),),
           ),
          ],
      );
    }
}

String getfio (ScheduleDay? schedule ) {
  String? temp = schedule!.employees!.first!.fio ?? '';
  logger.d(schedule!.employees!.first!.fio!);
  try {
    return temp ;
  }
  catch(e)
  {
  return '';
  }
}


