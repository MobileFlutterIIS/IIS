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

import 'package:iis/services/CheckValidatingUserAndPassword/LessonDto.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';

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
  double height = 120;
  double boxheight = 30;
  bool arrowup = true;

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
      StudyPage(certificate: certificates!,),
      MarkBookPage(markBook: markbook!,),
      GradeBookPage(gradebook: gradebook!,),
      OmissionsPage(omissions: omissions!,),
      ChangePassword(password: password!,),
      NavigationScreen(),
      DisciplinList(),
      Students(),
      StudentScale(),
      AdditionalFunctions(),
      ScheduleDepartment(),
      Departments(),
      Phonebook(),
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
      IconButton(icon: const Icon(Icons.person),onPressed: () {setState(() {pageNum = 0;});},),
      IconButton(icon: const Icon(Icons.people_alt_outlined),onPressed: () {setState(() {pageNum = 1;});},),
      IconButton(icon: const Icon(Icons.mark_as_unread),onPressed: () {setState(() {pageNum = 2;});},),
      IconButton(icon: const Icon(Icons.collections_bookmark_outlined),onPressed: () {setState(() {pageNum = 3;});},),
      IconButton(icon: const Icon(Icons.grade),onPressed: () {setState(() {pageNum = 4;});},),
      IconButton(icon: const Icon(Icons.circle_outlined),onPressed: () {setState(() {pageNum = 5;});},),
      IconButton(icon: const Icon(Icons.password),onPressed: () {setState(() {pageNum = 6;});},),
      IconButton(icon: const Icon(Icons.schedule),onPressed: () {setState(() {pageNum = 7;});},),
      IconButton(icon: const Icon(Icons.book),onPressed: () {setState(() {pageNum = 8;});},),
      IconButton(icon: const Icon(Icons.people),onPressed: () {setState(() {pageNum = 9;});},),
      IconButton(icon: const Icon(Icons.star_rate),onPressed: () {setState(() {pageNum = 10;});},),
      IconButton(icon: const Icon(Icons.settings),onPressed: () {setState(() {pageNum = 11;});},),
      IconButton(icon: const Icon(Icons.schema),onPressed: () {setState(() {pageNum = 12;});},),
      IconButton(icon: const Icon(Icons.home_filled),onPressed: () {setState(() {pageNum = 13;});},),
      IconButton(icon: const Icon(Icons.phone),onPressed: () {setState(() {pageNum = 14;});},),
      IconButton(icon: const Icon(Icons.announcement),onPressed: () {setState(() {pageNum = 15;});},),
    ];
    return FutureBuilder(
      future: initall(),
      builder: (BuildContext context, AsyncSnapshot<bool> f) {
        if (!f.hasData) return const CircularProgressIndicator();
        return Scaffold(
          bottomNavigationBar: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  height = arrowup ? 240 : 60;
                  boxheight = arrowup ? 0 : 30;
                  arrowup = !arrowup;
                });
              },
              child: Scaffold(
                bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                    iconTheme: const IconThemeData(color: Colors.black),
                  ),
                  child: AnimatedContainer(
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
                                        children: tabs.getRange(8, 12)
                                            .toList(),
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
                                        children: tabs.getRange(12, 15)
                                            .toList(),
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
                            child: Icon(arrowup
                                ? (Icons.keyboard_arrow_up_outlined)
                                : (Icons.keyboard_arrow_down_outlined)),
                          )),
                        ]
                    ),
                  ),
                ),
                body: Pages()[pageNum],
              ),
            ),
          ),

        );

      }
    );
  }
}