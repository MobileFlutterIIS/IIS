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
    return FutureBuilder(
        future: initall(),
        builder: (BuildContext context, AsyncSnapshot<bool> f) {
          if (!f.hasData) return CircularProgressIndicator();


          final pages = [
            MainPage(user: widget.user),
            GroupInfoPage(group: groupinfo!,),
            AnouncementPage(anouncement: anouncements!,),
            StudyPage(certificate: certificates!,),
            MarkBookPage(markBook: markbook!,),
            GradeBookPage(gradebook: gradebook!,),
            OmissionsPage(omissions: omissions!,),
            ChangePassword(password: password!,),
          ];

          void selectedItem(BuildContext context, int index) {
            Navigator.of(context).pop();
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GroupInfoPage(group: groupinfo!,),
                ));
                break;
              case 1:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AnouncementPage(anouncement: anouncements!,),
                ));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StudyPage(certificate: certificates!,),
                ));
                break;
              case 3:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MarkBookPage(markBook: markbook!,),
                ));
                break;
              case 4:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GradeBookPage(gradebook: gradebook!,),
                ));
                break;
              case 5:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OmissionsPage(omissions: omissions!,),
                ));
                break;
              case 6:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangePassword(password: password!,),
                ));
                break;
            }
          }

          return Scaffold(
            body: MainPage(user: widget.user),
            drawer: Drawer(
              child: Material(
                //color: Color.fromRGBO(22, 49, 99, 0.9),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 70,),
                    ListTile(
                      leading: Icon(Icons.group, ),
                      title: Text(
                        'Группы',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: Icon(Icons.book, ),
                      title: Text(
                        'Объявления',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: Icon(Icons.announcement, ),
                      title: Text(
                        'Учеба',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: Icon(Icons.bookmark, ),
                      title: Text(
                        'Зачётка',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: Icon(Icons.rate_review, ),
                      title: Text(
                        'Рейтинг',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: Icon(
                        Icons.circle_outlined, ),
                      title: Text(
                        'Пропуски',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 5),
                    ),
                    const SizedBox(height: 15,),
                    ListTile(
                      leading: const Icon(Icons.password, ),
                      title: const Text(
                        'Изменить пароль?',
                        //style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => selectedItem(context, 6),
                    ),
                  ],
                ),
              ),
            ),
            //backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
             // backgroundColor: const Color.fromRGBO(22, 49, 99, 0.9),
              centerTitle: true,
              title: Text(
                'И И С   "Б Г У И Р"',
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      AccountManager.removeCredentials();
                      Navigator.pop(context);
                    });
                  }
                ),
              ],
            ),

          );
        }
    );
  }
}

