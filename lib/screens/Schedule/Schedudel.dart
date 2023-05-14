import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';
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

  DateTime now = new DateTime.now();
  int? curweek;
  List<DateTime> days20 = [];
  String chosenschedule = '';

  void initdays20() {
    days20.add(now);
    DateTime temp = now;
    for (int i = 0; i < 19; i++) {
      temp = temp.add(Duration(days: 1));
      days20.add(temp);
      logger.d(days20[i]);
    }
  }

  Future<bool> getcurweek() async
  {
    curweek = await ManagerClass.getWeek();
    return true;
  }

  @override
  void initState() {
    now = DateTime.now();
    ///
    /// FIX LATER VERY IMPORTANT
    ///
    initdays20();
    logger.v(widget.whattobuild);
    //ManagerClass.getGroupsScheduleToBase('253502');
    //tempfunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScheduleInfo? _schedule = widget.whattobuild;
    return FutureBuilder(
      future: getcurweek(),
      builder: (BuildContext context, AsyncSnapshot<bool> t) {
        if (!t.hasData || t == null) return CircularProgressIndicator();
        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: SafeArea(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    //child: Text('btbt'),
                      child: ScheduleForDay(context, days20[index], _schedule!)
                  );
                }
            ),
          ),
        );
      }
    );
  }

  int getdayweek(DateTime input)
  {
    var diff = now.difference(input);
    var weeks = diff.inDays.toDouble();
    weeks = weeks / 7;
    var temp = curweek!;
    if (now.weekday > input!.weekday!)
      temp += weeks.floor();
    else
      temp += weeks.ceil();
    temp %= 4;
    if (temp == 0) temp = 4;
    temp = 4 - temp;
    if (temp == 0) temp = 4;
    return temp;
  }

  Widget ScheduleForDay(BuildContext context, DateTime day,
      ScheduleInfo schedule) {
    ///
    ///  CHECK FOR CORRECTNESS, CAN GET FROM NET
    ///
    int? week = getdayweek(day);
    int weekday = day.weekday - 1;
    List<ScheduleDay?>? dayofweek;
    String Stringdayofweek;
    switch (weekday) {
      case 0 :
        dayofweek = schedule!.schedules!.Monday;
        Stringdayofweek = "Понедельник";
        break;
      case 1 :
        dayofweek = schedule!.schedules!.Tuesday;
        Stringdayofweek = "Вторник";
        break;
      case 2 :
        dayofweek = schedule!.schedules!.Wednesday;
        Stringdayofweek = "Среда";
        break;
      case 3 :
        dayofweek = schedule!.schedules!.Thursday;
        Stringdayofweek = "Четверг";
        break;
      case 4 :
        dayofweek = schedule!.schedules!.Friday;
        Stringdayofweek = "Пятница";
        break;
      case 5 :
        dayofweek = schedule!.schedules!.Saturday;
        Stringdayofweek = "Суббота";
        break;
      default:
        dayofweek = [];
        Stringdayofweek = "Воскресенье";
        break;
    }

    List<ScheduleDay> scheduleitself = [];
    if (dayofweek != null)
      dayofweek!.forEach((element) {
        //logger.d("${element!.startLessonDate} ${element!.endLessonDate} ${element} ${element!.weekNumber} ${element!.subject}${element!.lessonTypeAbbrev}");
        if (
            (element!.lessonTypeAbbrev == null || (element!.lessonTypeAbbrev! != "Экзамен" && element!.lessonTypeAbbrev! != "Консультация"))
               &&
                (
                    (element!.startLessonDate == null || element!.endLessonDate == null) ||
            (
                    (
                        DateFormat('dd.MM.yy').parse(element!.startLessonDate!).isBefore(day)
                        ///
                        /// ХЗ как будет лучше выводить, подумай еще
                        ///

                  //       &&
                  // DateFormat('dd.MM.yy').parse(element!.endLessonDate!).isAfter(day)
                    )
            )
                && (element!.weekNumber == null ||
                    element!.weekNumber!.contains(week)))
         ) {
          scheduleitself.add(element);
        }
      });

    if (scheduleitself.isNotEmpty) {
      return Column(
        children: [
          Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Text("${Stringdayofweek}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Text(" ${day.day}.${day.month.toInt() < 10 ? '0' : ''}${day
                    .month}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Text(" ${week!}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Expanded(child: Divider()),
              ]
          ),

          Container(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scheduleitself.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      color: Colors.black12,
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(12)),
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(scheduleitself![index].startLessonTime!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),),
                              Text(scheduleitself![index].endLessonTime!
                                  .toString(), style: TextStyle(
                                  color: Colors.white, fontSize: 15),)
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                            decoration: BoxDecoration(
                              color: getcolor(scheduleitself![index]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 10,
                            height: 80,
                            //color: scheduleitself![index].lessonTypeAbbrev! == "ЛР"? Colors.red :(scheduleitself![index].lessonTypeAbbrev! == "Лk"? Colors.green : Colors.yellow),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 120,
                            height: 85,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(scheduleitself![index].subject != null
                                    ? "${scheduleitself![index].subject!}(${scheduleitself![index].lessonTypeAbbrev!})"
                                    : "PLACEHOLDER", style: TextStyle(
                                    color: Colors.white, fontSize: 20),),
                                Text(
                                  scheduleitself![index].auditories!.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),)
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
                                Text(scheduleitself![index].weekNumber != null
                                    ? scheduleitself![index].weekNumber!
                                    .toString()
                                    : "ALL WEEKS", style: TextStyle(
                                    color: Colors.white, fontSize: 15),),

                                ///
                                /// BE CAREFUL HERE        |          |   getfio(scheduleitself[index])
                                ///
                                Text(getfio(scheduleitself![index]), style: TextStyle(
                                    color: Colors.white, fontSize: 10),)
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
    else {
      ///PLACEHOLDER WHEN NO LESSONS
      return Column(
        children: [
          Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Text("${Stringdayofweek}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Text(" ${day.day}.${day.month.toInt() < 10 ? '0' : ''}${day
                    .month}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Expanded(child: Divider()),
              ]
          ),
          Container(
            height: 30,
            child:
            Card(color: Colors.black12,
              elevation: 4,
              child: Text('Нет Занятий в этот день',
                style: TextStyle(color: Colors.white, fontSize: 20),),),
          ),
        ],
      );
    }
  }

  Color getcolor(ScheduleDay? schedule)
  {
    switch(schedule!.lessonTypeAbbrev!)
    {
      case "ЛК": {return Colors.green; break;}
      case "ЛР": {return Colors.red; break;}
      case "ПЗ": {return Colors.yellowAccent; break;}
      default : {return Colors.white; break;}
    }
  }

  String getfio(ScheduleDay? schedule) {
    try {
    String? temp = "${schedule!.employees!.first!.lastName} ${schedule!.employees!.first!.firstName!.substring(0, 1)}. ${schedule!.employees!.first!.middleName!.substring(0, 1)}.";
    //logger.d(schedule!.employees!.first!.firstName);
      return temp;
    }
    catch (e) {
      return '';
    }
  }

}
