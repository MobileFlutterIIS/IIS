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
import 'package:iis/screens/AdditionalFunctions.dart';
import 'package:iis/screens/Disciplines/DisciplinList.dart';
import 'package:iis/screens/Rating/StudentScale.dart';
import 'package:iis/screens/Account/UserLogin.dart';
import 'package:iis/screens/Account/AccountPage.dart';
import 'package:iis/screens/Schedule/NavigationBetween.dart';
import 'package:iis/screens/Students/Students.dart';
import 'package:iis/screens/Departments/ScheduleDepartment.dart';
import 'package:iis/screens/Departments/Departments.dart';
import 'package:iis/screens/PhoneBook/Phonebook.dart';
import 'package:iis/screens/Account/Dormitory.dart';
import 'package:iis/screens/Account/Diploma.dart';
import 'package:iis/screens/Account/Penalties.dart';

import 'package:iis/services/CheckValidatingUserAndPassword/LessonDto.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';

class NavBarAccount extends StatefulWidget{
  UserEntity user = UserEntity();
  String password;

  NavBarAccount({
    super.key,
    required this.user,
    required this.password});

  @override
  State<NavBarAccount> createState() => _NavBarAccountState();
}

class _NavBarAccountState extends State<NavBarAccount> {

  int pageNum = 0;
  double height = 60;
  double boxheight = 30;
  bool arrowup = true;
  bool textvisible = false;

  void collapse()
  {
    setState(() {
      height=60;
      boxheight = 30;
      arrowup = true;
      textvisible = false;
    });
  }
  void open()
  {
    setState(() {
      height=220;
      boxheight = 0;
      arrowup = false;
      textvisible = true;
    });
  }


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
    // logger.d(certificates);
    // logger.d(groupinfo);
    // logger.d(anouncements);
    // logger.d(marksheets);
    // logger.d(markbook);
    // logger.d(gradebook);
    // logger.d(omissions);
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

  List<Widget> Pages() {
    List<Widget> pages = [
      MainPage(user: widget.user),
      GroupInfoPage(group: groupinfo!,),
      AnouncementPage(anouncement: anouncements!,),
      StudyPage(certificate: certificates!, marksheet: marksheets!,),
      MarkBookPage(markBook: markbook!,),
      GradeBookPage(gradebook: gradebook!,),
      OmissionsPage(omissions: omissions!,),
      ChangePassword(password: password!,),
      Dormitory(),
      Diploma(),
      Penalties(),
    ];
    if (widget.user != null) {
      return pages;
    } else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context){
    final tabs = <Widget>[
      Column(children: [IconButton(icon: const Icon(Icons.person),onPressed: () {collapse(); setState(() {pageNum = 0;});},),AnimatedOpacity(child: Text('Профиль',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.people_alt_outlined),onPressed: () {collapse();setState(() {pageNum = 1;});},),AnimatedOpacity(child: Text('Группа',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.mark_as_unread),onPressed: () {collapse();setState(() {pageNum = 2;});},),AnimatedOpacity(child: Text('Объявления',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.collections_bookmark_outlined),onPressed: () {collapse();setState(() {pageNum = 3;});},),AnimatedOpacity(child: Text('Учеба',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.grade),onPressed: () {collapse();setState(() {pageNum = 4;});},),AnimatedOpacity(child: Text('Зачетка',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.circle_outlined),onPressed: () {collapse();setState(() {pageNum = 5;});},),AnimatedOpacity(child: Text('Рейтинг',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.access_time_rounded),onPressed: () {collapse();setState(() {pageNum = 6;});},),AnimatedOpacity(child: Text('Пропуски',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.password),onPressed: () {collapse();setState(() {pageNum = 7;});},),AnimatedOpacity(child: Text('Смена пароля',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.house_siding_outlined),onPressed: () {collapse();setState(() {pageNum = 8;});},),AnimatedOpacity(child: Text('Общежитие',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.my_library_books_rounded),onPressed: () {collapse();setState(() {pageNum = 9;});},),AnimatedOpacity(child: Text('Диплом',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: const Icon(Icons.error_sharp),onPressed: () {collapse();setState(() {pageNum = 10;});},),AnimatedOpacity(child: Text('Взыскания',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
    ];
    return FutureBuilder(
      future: initall(),
      builder: (BuildContext context, AsyncSnapshot<bool> f) {
        if (!f.hasData) return const CircularProgressIndicator();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: GestureDetector(
            onPanUpdate: (details) {
              int sensitivity = 1;
              if (details.delta.dy < -sensitivity)
                open();
              if (details.delta.dy >sensitivity )
                collapse();
            },
            // onTap: () {
            //   setState(() {
            //     height = arrowup ? 240 : 60;
            //     boxheight = arrowup ? 0 : 30;
            //     arrowup = !arrowup;
            //   });
            // },
            child: Scaffold(
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                child: AnimatedContainer(
                  clipBehavior: Clip.none,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  height: height,
                  child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        BottomAppBar(
                          //color: Colors.blue,
                          child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column
                                  (
                                  children: [
                                    Row
                                      (
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: tabs.getRange(0, 4).toList(),
                                    ),
                                    AnimatedContainer(
                                        curve: Curves.easeInOutCubic,
                                        duration: const Duration(
                                            milliseconds: 500),
                                        height: boxheight, child: SizedBox()),
                                    Row
                                      (
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: tabs.getRange(4, 8).toList(),
                                    ),
                                    AnimatedContainer(
                                        curve: Curves.easeInOutCubic,
                                        duration: const Duration(
                                            milliseconds: 500),
                                        height: boxheight, child: SizedBox()),
                                    Row
                                      (
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: tabs.getRange(8, 11).toList(),
                                    ),
                                    const SizedBox(height: 20,)
                                  ],
                                ),
                              )
                          ),
                        ),
                        Positioned(width: MediaQuery
                            .of(context)
                            .size
                            .width, child: AnimatedSwitcher
                          (
                          duration: const Duration(milliseconds: 500),
                          child: IconButton(
                            icon: Icon(arrowup
                                ? (Icons.keyboard_arrow_up_outlined)
                                : (Icons.keyboard_arrow_down_outlined)),
                            onPressed: (){
                              setState(() {
                                arrowup? open(): collapse();
                              });
                            },
                          ),
                        )),
                      ]
                  ),
                ),
              ),
              body: SafeArea(child: Column(children: [Expanded(child: Pages()[pageNum])])),
            ),
          ),

        );

      }
    );
  }
}