import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:flutter/material.dart';
import 'package:iis/screens/Schedule/Schedudel.dart';
import 'package:iis/screens/Schedule/Lists.dart';
import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}


class _NavigationScreenState extends State<NavigationScreen> {


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

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
        //
        //},),
      ),
      drawer: drawer(context, list),
      body: Center(child: SafeArea(child: ((whatscedule != null) ? Schedule(whatscedule!) : Center(child: Icon(Icons.downloading),)))),
    );
  }


  Widget drawer(BuildContext context, List<ScheduleInfo> Schedules) {
    return Drawer(
      child: Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black38,
                child: ListView.builder(
                  itemCount: Schedules.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setwhattobuild(index);
                        Navigator.pop(context);
                      },
                      child: Card
                        (
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(12)),),
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(getname(Schedules![index]),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),),
                              ),
                            ],
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
          ],
        ),
      ),
    );
  }


  String getname(ScheduleInfo? schedule) {
    logger.d('${schedule} ${schedule!.studentGroupDto} ${schedule!.employeeDto}');
    if (schedule!.studentGroupDto != null) {
      logger.d (schedule!.studentGroupDto!.name);
      return schedule!.studentGroupDto!.name!;
    }
    else {
      logger.d(schedule!.employeeDto!.lastName);
      return schedule!.employeeDto!.lastName!;
    }
  }

}