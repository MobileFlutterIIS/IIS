
import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:iis/data/ScheduleAndListManagement/Schedules.dart';
import 'package:iis/data/ScheduleAndListManagement/Tutors.dart';
import 'package:iis/data/ScheduleAndListManagement/Groups.dart';
import 'package:iis/services/InternetInfoAndFetch.dart';
import 'package:logger/logger.dart';

final logger = new Logger();

class ManagerClass with ChangeNotifier
{
  static Tutorsdatabase tutors = Tutorsdatabase();
  static Groupsdatabase groups = Groupsdatabase();
  static Schedulesdatabase schedules = Schedulesdatabase();


  ///
  /// TUT ROFLANEBALO
  /// PEREDELAI getGroups
  ///           getPosts
  ///
  static Future<List<Post>?> getPosts() async
  {
    List<Post>? temp =[];
    //temp = await InternetInfo.GetPostsNet();
    if (temp!.isNotEmpty) { tutors.clearAll() ;await tutors.fillAll(temp); logger.d ('Not empty');}
    else {temp = tutors.getPosts(); temp!.sort((a, b) => a.lastName!.compareTo(b.lastName!) ) ; logger.d ('Empty');}
    return temp;
  }

  static Future<List<Group>?> getGroups() async
  {
    List<Group>? temp =[];
    //temp = await InternetInfo.GetGroupsNet();
    if (temp!.isNotEmpty) { groups.clearAll() ;await groups.fillAll(temp); logger.d ('Not empty');}
    else {temp = groups.getGroups(); temp!.sort((a, b) => a.name!.compareTo(b.name!)) ; logger.d ('Empty');}
    return temp;
  }

  static Future<List<ScheduleInfo>?> getSchedules() async
  {
    List<ScheduleInfo>? temp;
    temp = await schedules.getSchedules();
    if (temp!.isNotEmpty) {
      logger.d('Not empty');
      //else {temp = groups.getGroups(); temp!.sort((a, b) => a.name!.compareTo(b.name!)) ; logger.d ('Empty');}
    }
    return temp;
  }

  static Future<ScheduleInfo?> getGroupScheduleFromBase(String key) async
  {
    ScheduleInfo? temp;
    temp = await schedules.getValue(key);
    if (temp != null) {
      logger.d('Not empty');
      //else {temp = groups.getGroups(); temp!.sort((a, b) => a.name!.compareTo(b.name!)) ; logger.d ('Empty');}
    }
    return temp;
  }

  static Future<void> getGroupsScheduleToBase(String group) async
  {
    ScheduleInfo? temp;
    temp = await InternetInfo.GetGroupScheduleNet(group);
    if (temp != Null)
    {
      logger.d('U got new schedule ${temp}, ${group}, hehe(${temp!.schedules!.Friday})');
      schedules.addValue(group, temp);
    }
    else
      logger.d('no shcedule for u bruv :(');
  }

  static Future<ScheduleInfo?> getTutorScheduleFromBase(Post tutor) async
  {
    ScheduleInfo? temp;
    temp = await schedules.getValue(tutor.fio!);
    if (temp != null) {
      logger.d('Not empty');
      //else {temp = groups.getGroups(); temp!.sort((a, b) => a.name!.compareTo(b.name!)) ; logger.d ('Empty');}
    }
    return temp;
  }

  static Future<void> getTutorScheduleToBase(Post tutor) async
  {
    ScheduleInfo? temp;
    temp = await InternetInfo.GetTutorScheduleNet(tutor);
    logger.d('tuttor ${temp}');
    if (temp != Null)
    {
      logger.d('U got new schedule ${temp}, ${tutor}, hehe(${temp!.schedules!.Friday})');
      schedules.addValue(tutor.id, temp);
    }
    else
      logger.d('no shcedule for u bruv :(');
  }

  Future<void> UpdateAll() async
  {
    ///
    /// ADD WIDGET TO LOAD
    ///
    bool gtg = await InternetInfo.GetConnect();
    if (gtg)
    {
      List<Group>? temp1 = [];
      temp1 = await InternetInfo.GetGroupsNet();
      if (temp1!.isNotEmpty) { groups.clearAll() ;await groups.fillAll(temp1);}
      List<Post>? temp2 =[];
      temp2 = await InternetInfo.GetPostsNet();
      if (temp2!.isNotEmpty) { tutors.clearAll() ;await tutors.fillAll(temp2);}
      List<ScheduleInfo>? temp3;
      temp3 = await schedules.getSchedules();
      if (temp3 != null)
      temp3.forEach((element) {
        if (element.employeeDto != null)
          {
            getTutorScheduleToBase(element.employeeDto!);
          }
        else
          {
            getGroupsScheduleToBase(element.studentGroupDto!.name!);
          }
        logger.i("Done Updating");
      });
    }
    //notifyListeners();
  }

}

