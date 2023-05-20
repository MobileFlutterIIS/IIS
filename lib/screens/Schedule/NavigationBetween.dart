import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:flutter/material.dart';
import 'package:iis/screens/Schedule/Schedudel.dart';
import 'package:iis/screens/Schedule/Lists.dart';
import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';
import 'package:logger/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/http.dart';

final logger = Logger();


/// TODO
///
/// 1) fix week | DONE
/// 2) add delete | DONE
/// 3) add favorite
/// 4) add sorting types
/// 5) fix view  | MOSTLY DONE
/// 6) add on press info
/// 7) add themes | WILL BE DONE
/// 8) change side slider to bottom shit
/// 9) add save last opened
/// 10) add exams
/// 11) add groups view
/// 12) add whole shedule

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}


class _NavigationScreenState extends State<NavigationScreen> {

   ManagerClass manager = ManagerClass();
  ScheduleInfo? whatscedule;
  String? lastopened;
  List<ScheduleInfo> list = [];

  ///
  /// RESOLVE LATER
  ///
  // Future<void> getlastopenedschedule() async {
  //   final _lastopenedschedule = await SharedPreferences.getInstance();
  //   lastopened = _lastopenedschedule.getString("lastopenedschedule");
  // }

  Future<void> getlist() async {
    list.clear();
    List<ScheduleInfo>? temp = await ManagerClass.getSchedules();
    setState(() {
      list.addAll(temp!);
      if (!list.isEmpty)
      whatscedule = list[0];
      else
        whatscedule = null;
      logger.d('${list} ${list.length}');
    });
  }

  Future<void> setwhattobuild(int index) async
  {
    ScheduleInfo temp = await list[index];
    setState(() {
      whatscedule = temp;
      //logger.v(whatscedule!.studentGroupDto!.name);

    });
  }
  @override
  void initState() {
    getlist();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('_schedulesBox').listenable(),
      builder: (context, box,_) => Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: [
              SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.person),
                  iconSize: MediaQuery.of(context).size.width * 0.06,
                  onPressed: () {
                    // Действия при нажатии на кнопку
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.031,
              ),
              const Text(
                'Расписание',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.34,
              ),
              SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: MediaQuery.of(context).size.width * 0.06,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      itemCount: list.length,
                                      itemBuilder: (context, index) {
                                        return Dismissible(
                                          key: UniqueKey(),
                                          direction: DismissDirection.endToStart,
                                          onDismissed: (DismissDirection direction) async
                                          {
                                            setState(() {
                                              ManagerClass.schedules.deleteValue(getkey(list[index]));
                                              list.removeAt(index);
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              setwhattobuild(index);
                                              Navigator.pop(context);
                                            },
                                            child: Card(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                side: BorderSide(width: 1.5, color: Colors.grey[400]!), // Adjust the border width and color as needed
                                              ),
                                              elevation: 3,
                                              child: Container(
                                                color: Colors.white70,
                                                //decoration: BoxDecoration(),
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        getname(list[index]),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: 'NotoSerif',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  child: ElevatedButton(onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => Lists(),),).then((_) => getlist());
                                  }, child: const Icon(Icons.add),)
                              ),
                              Container(
                                  child: ElevatedButton(onPressed: () async {
                                    WaitUpdateIndicator(manager.UpdateAll());
                                    //await manager.UpdateAll();
                                    setState(() {
                                      getlist();
                                    });
                                  }, child: const Icon(Icons.update_outlined),)
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black, // Цвет иконки
          ),
        ),

        //drawer: drawer(context),
          body: Center(child: SafeArea(child: ((whatscedule != null) ? Schedule(whatscedule!) : Center(child: Icon(Icons.downloading),)))),

      ),
    );
  }


  Widget drawer(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('_schedulesBox').listenable(),
      builder: (context,box,_) => Drawer(
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black38,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection direction) async
                        {
                          setState(() {
                             ManagerClass.schedules.deleteValue(getkey(list[index]));
                            list.removeAt(index);
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            setwhattobuild(index);
                            Navigator.pop(context);
                          },
                          child: Card
                            (
                            color: Colors.black87,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12)),),
                            elevation: 10,
                            child: Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(getname(list[index]),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'NotoSerif',
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  child: ElevatedButton(onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Lists(),),).then((_) => getlist());
                  }, child: Icon(Icons.add),)
              ),
              Container(
                  child: ElevatedButton(onPressed: () async {
                    WaitUpdateIndicator(manager.UpdateAll());
                    //await manager.UpdateAll();
                    setState(() {
                      getlist();
                    });
                  }, child: Icon(Icons.update_outlined),)
              ),
            ],
          ),
        ),
      ),
    );
  }


  WaitUpdateIndicator(Future<dynamic> a) async {
        showDialog(
          barrierDismissible: false,
            context: context,
            builder: (_) {return Dialog(
              child: CircularProgressIndicator(),
            );
          }
        );
        await a;
        Navigator.of(context).pop();
 }

  String getname(ScheduleInfo? schedule) {
    logger.d('${schedule} ${schedule!.studentGroupDto} ${schedule!.employeeDto}');
    if (schedule.studentGroupDto != null) {
      logger.d (schedule.studentGroupDto!.name);
      return schedule.studentGroupDto!.name!;
    }
    else {
      logger.d(schedule.employeeDto!.lastName);
      return schedule.employeeDto!.lastName!;
    }
  }
   dynamic getkey(ScheduleInfo? schedule) {
     logger.d('${schedule} ${schedule!.studentGroupDto} ${schedule!.employeeDto}');
     if (schedule.studentGroupDto != null) {
       logger.d (schedule.studentGroupDto!.name);
       return schedule.studentGroupDto!.name!;
     }
     else {
       logger.d(schedule.employeeDto!.lastName);
       return schedule.employeeDto!.id!;
     }
   }

}