import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:dio/dio.dart';
import 'package:iis/screens/Account/AccountMainPage.dart';
import 'package:iis/screens/Account/GroupInfo.dart';
import 'package:iis/screens/Account/Notifications.dart';
import 'package:iis/screens/Account/Study.dart';
import 'package:iis/screens/Account/MarkBookPages/MarkBookPage.dart';
import 'package:iis/screens/Account/GradeBookPage.dart';
import 'package:iis/screens/Account/OmissionsPage.dart';

import 'package:iis/services/CheckValidatingUserAndPassword/LessonDto.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
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

  List<Certificate>? certificates;
  List<Anouncement>? anouncements;
  Groupinfo? groupinfo;
  List<MarkSheet>? marksheets;
  Markbook? markbook;
  List<GradeBook>? gradebook;
  List<Omission>? omissions;
  static bool sucs = false;

  Future<bool> initall() async{
    if(sucs) return true;
    certificates =(await AccountManager.UserCetificate());
    groupinfo =(await AccountManager.UserGroupInfo());
    anouncements =(await AccountManager.UserNotifications());
    marksheets = (await AccountManager.UserMarkSheets());
    markbook = (await AccountManager.UserMarkBook());
    gradebook = (await AccountManager.UserGradeBook());
    omissions = (await AccountManager.UserOmissions());
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
      builder: (BuildContext context,AsyncSnapshot<bool> f) {

        if(!f.hasData) return CircularProgressIndicator();



        final pages = [
          MainPage(user: widget.user),
          GroupInfoPage(group: groupinfo!,),
          AnouncementPage(anouncement: anouncements!,),
          StudyPage(certificate: certificates!,),
          MarkBookPage(markBook: markbook!,),
          GradeBookPage(gradebook: gradebook!,),
          OmissionsPage(omissions: omissions!,),
        ];

        void selectedItem(BuildContext context, int index) {

          Navigator.of(context).pop();
          switch(index){
            case 0:
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GroupInfoPage(group: groupinfo!,),
              ));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AnouncementPage(anouncement: anouncements!,),
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
          }
        }

        return Scaffold(
          body: MainPage(user: widget.user),
          drawer: Drawer(
            child: Material(
              color: Color.fromRGBO(22, 49, 99, 0.9),
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 70,),
                  ListTile(
                    leading: Icon(Icons.group, color: Colors.white,),
                    title: Text(
                      'Группы',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 15,),
                  ListTile(
                    leading: Icon(Icons.book, color: Colors.white,),
                    title: Text(
                      'Учеба',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 15,),
                  ListTile(
                    leading: Icon(Icons.announcement, color: Colors.white,),
                    title: Text(
                      'Объявления',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 15,),
                  ListTile(
                    leading: Icon(Icons.bookmark, color: Colors.white,),
                    title: Text(
                      'Зачётка',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 15,),
                  ListTile(
                    leading: Icon(Icons.rate_review, color: Colors.white,),
                    title: Text(
                      'Рейтинг',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 15,),
                  ListTile(
                    leading: Icon(Icons.circle_outlined, color: Colors.white,),
                    title: Text(
                      'Пропуски',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(22, 49, 99, 0.9),
            centerTitle: true,
            title: Text(
              'И И С   "Б Г У И Р"',
            ),
          ),
        //   body: SafeArea(
        //     child: pages[_selectedIndex],
        //   ),
        //   bottomNavigationBar: BottomNavigationBar(
        //
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person,color: Color.fromRGBO(51, 40, 32, 0.7),),
        //       label: 'Главная',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.people,color: Color.fromRGBO(51, 40, 32, 0.7),),
        //       label: 'Группа',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.book,color: Color.fromRGBO(51, 40, 32, 0.7),),
        //       label: 'Учеба',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.announcement,color: Color.fromRGBO(51, 40, 32, 0.7),),
        //       label: 'Объявления',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.circle, color: Color.fromRGBO(51, 40, 32, 0.7)),
        //       label: 'Пропуски',
        //     ),
        //     // BottomNavigationBarItem(
        //     //   icon: Icon(Icons.circle, color: Colors.pink),
        //     //   label: 'Пропуски',
        //     // ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   //selectedItemColor: Colors.amber[800],
        //   selectedItemColor: Colors.black,
        //   onTap: (currentindex) {
        //     setState(() {
        //       _selectedIndex = currentindex;
        //     });
        //   },
        // ),
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