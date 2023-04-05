import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';


final logger = Logger();

class InternetInfo
{
  static final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  static var hasconnect =false;
  static late StreamSubscription subscription;

  static bool GetConnect() {
    subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async
        {
          var t = await InternetConnectionChecker().hasConnection;
          logger.d('Connection is $t');
          hasconnect = t;
        });
    return hasconnect;
  }

  static  Future<List<Post>?> GetPostsNet() async
  {
    GetConnect();
      logger.d("${hasconnect} ");
      List<Post> data = await client.getTasks();
      if (data.isNotEmpty && hasconnect) {
        logger.d('New list from net');
      }
      else logger.d('No List form net');
      return (data!);

  }

  static  Future<List<Group>?> GetGroupsNet() async
  {
    GetConnect();
    logger.d("${hasconnect} ");
    List<Group> data = await client.getGroups();
    if (data.isNotEmpty && hasconnect) {
      logger.d('New list from net');
    }
    else logger.d('No List form net');
    return (data!);

  }

  static  Future<ScheduleInfo> GetGroupScheduleNet(String groupnumber) async
  {
    await GetConnect();
    logger.d("${hasconnect} ");
    ScheduleInfo? data = await client.getGroupSchedule(groupnumber);
    logger.d(data);
    if (data != Null && hasconnect) {
      logger.d('New list from net');
    }
    return (data!);

  }

  static  Future<ScheduleInfo> GetTutorScheduleNet(Post tutor) async
  {
    await GetConnect();
    logger.d("${hasconnect} ");
    ScheduleInfo? data = await client.getTutorSchedule(tutor.urlId);
    logger.d(data);
    if (data != Null && hasconnect) {
      logger.d('New list from net');
    }
    return (data!);

  }


}