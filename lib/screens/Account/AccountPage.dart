import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:dio/dio.dart';
import 'package:iis/screens/Account/AccountMainPage.dart';
import 'package:iis/screens/Account/GroupInfo.dart';
import 'package:iis/screens/Account/Notifications.dart';
import 'package:iis/screens/Account/Study.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';

class AccountPage extends StatefulWidget{
  UserEntity user = UserEntity();

  AccountPage({super.key, required this.user});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

///
/// на данный момент данные создаются при заходе в окно аакаунта
/// возможно стоит добавить их соранение до закрытия приложения в статик памяти
/// но я хз пока что
///


class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;
  List<Certificate>? certificates;
  List<Anouncement>? anouncements;
  Groupinfo? groupinfo;
  List<MarkSheet>? marksheets;
  static bool sucs = false;

  Future<bool> initall() async{
    if(sucs) return true;
    certificates =(await AccountManager.UserCetificate());
    groupinfo =(await AccountManager.UserGroupInfo());
    anouncements =(await AccountManager.UserNotifications());
    marksheets = (await AccountManager.UserMarkSheets());
    logger.d(certificates);
    logger.d(groupinfo);
    logger.d(anouncements);
    logger.d(marksheets);
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
      builder: (BuildContext context,AsyncSnapshot<bool> f) {

        if(!f.hasData) return CircularProgressIndicator();

        final pages = [
          MainPage(user: widget.user),
          GroupInfoPage(group: groupinfo!,),
          AnouncementPage(anouncement: anouncements!,),
          StudyPage(certificate: certificates!,),
        ];

        return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(251, 150, 158, 0.9),
        ),
        body: SafeArea(
          child: pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.pink,),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people,color: Colors.pink,),
              label: 'Группа',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book,color: Colors.pink,),
              label: 'Учеба',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement,color: Colors.pink,),
              label: 'Объявления',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (currentindex) {
            setState(() {
              _selectedIndex = currentindex;
            });
          },
        ),
      );
      }
    );
  }


// const SizedBox(height: 20),
// Row(
// children: [
// const Icon(Icons.person, size: 32),
// Text(user.faculty! + ', ' + user.speciality! + ', ' + user.course.toString(),
// style: const TextStyle(
// fontSize: 24,
// color: Colors.black
// )
// ),
// ],
// ),
// SizedBox(height: 155),
// Container(
//
//   decoration: const BoxDecoration(
//     color: Color.fromRGBO(152, 152, 210, 0.9),
//   ),
// ),
/*Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                        child: Image.network(
                            user.photoUrl ?? '',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                        ),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),*/
}