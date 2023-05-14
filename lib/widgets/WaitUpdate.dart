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
import 'package:provider/provider.dart';

WaitUpdateIndicator(BuildContext context,Future<dynamic> a) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {return Dialog(
        child: Center(child: CircularProgressIndicator()),
      );
      }
  );
  await a;
  Navigator.of(context).pop();
}