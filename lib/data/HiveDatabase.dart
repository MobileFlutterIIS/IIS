import 'dart:io';


import 'package:iis/data/ScheduleAndListManagement/Tutors.dart';
import 'package:iis/data/ScheduleAndListManagement/Groups.dart';
import 'package:iis/data/ScheduleAndListManagement/Schedules.dart';
import 'package:iis/data/ScheduleAndListManagement/DateWeek.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:path_provider/path_provider.dart'as pathProvider;
import 'package:hive_flutter/hive_flutter.dart';
class HiveInjector
{

  static Future<void> setup() async
  {
    await Hive.initFlutter();
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _registerAdapters();
    await Hive.openBox(Groupsdatabase.groupsBox);
    await Hive.openBox(Tutorsdatabase.tutorsBox);
    await Hive.openBox(Schedulesdatabase.schedulesBox);
    await Hive.openBox(DataDataBase.dateBox);

  }

  static void _registerAdapters()
  {
    Hive.registerAdapter(PostAdapter());
    Hive.registerAdapter(GroupAdapter());
    Hive.registerAdapter(ScheduleInfoAdapter());
    Hive.registerAdapter(ScheduleDayAdapter());
    Hive.registerAdapter(ScheduleWeekAdapter());
    Hive.registerAdapter(DateWeekAdapter());
    Hive.registerAdapter(studentGroupAdapter());
  }

}