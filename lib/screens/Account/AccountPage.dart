import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:dio/dio.dart';
import 'package:iis/screens/Account/AccountMainPage.dart';
import 'package:iis/screens/Account/GroupInfo.dart';
import 'package:iis/screens/Account/Notifications.dart';
import 'package:iis/screens/Account/Study.dart';
import 'package:iis/screens/Account/MarkBookPage.dart';
import 'package:iis/screens/Account/GradeBookPage.dart';
import 'package:iis/screens/Account/OmissionsPage.dart';
import 'package:iis/screens/Account/PasswordChange/ChangePassword.dart';
import 'package:iis/widgets/NavBarAccount.dart';

import 'package:iis/services/CheckValidatingUserAndPassword/LessonDto.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';

class AccountPage extends StatefulWidget{
  UserEntity user = UserEntity();
  String password;

  AccountPage({
    super.key,
    required this.user,
    required this.password});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

///
/// на данный момент данные создаются при заходе в окно аакаунта
/// возможно стоит добавить их соранение до закрытия приложения в статик памяти
/// но я хз пока что
///


class _AccountPageState extends State<AccountPage> {

  List<Certificate>? certificates;
  List<Anouncement>? anouncements;
  Groupinfo? groupinfo;
  List<MarkSheet>? marksheets;
  Markbook? markbook;
  List<GradeBook>? gradebook;
  List<Omission>? omissions;
  String? password;
  static bool sucs = false;

  Future<bool> initall() async {
    if (sucs) return true;
    certificates = (await AccountManager.UserCetificate());
    groupinfo = (await AccountManager.UserGroupInfo());
    anouncements = (await AccountManager.UserNotifications());
    marksheets = (await AccountManager.UserMarkSheets());
    markbook = (await AccountManager.UserMarkBook());
    gradebook = (await AccountManager.UserGradeBook());
    omissions = (await AccountManager.UserOmissions());
    password = widget.password;
    logger.d(certificates);
    logger.d(groupinfo);
    logger.d(anouncements);
    logger.d(marksheets);
    logger.d(markbook);
    logger.d(gradebook);
    logger.d(omissions);
    sucs = true;
    return true;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sucs = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height,
        child: NavBarAccount(user: widget.user,password: widget.password,),
      ),
    );
  }
}

