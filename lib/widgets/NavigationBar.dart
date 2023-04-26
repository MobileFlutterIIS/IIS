import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iis/screens/AdditionalFunctions.dart';
import 'package:iis/screens/Disciplines/DisciplinList.dart';
import 'package:iis/screens/Rating/StudentScale.dart';
import 'package:iis/screens/Account/UserLogin.dart';
import 'package:iis/screens/Account/AccountPage.dart';
import 'package:iis/screens/Schedule/NavigationBetween.dart';
import 'package:iis/screens/Students/Students.dart';
import 'package:iis/screens/ScheduleDepartment.dart';
import 'package:iis/screens/Departments/Departments.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _MyNavBar();
}

class _MyNavBar extends State<NavBar> {
  int pageNum = 0;
  final pages = [
    NavigationScreen(),
    DisciplinList(),
    Students(),
    UserLogin(),
    StudentScale(),
    AdditionalFunctions(),
    ScheduleDepartment(),
    Departments(),

  ];
  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      Icon(Icons.schedule),
      Icon(Icons.book),
      Icon(Icons.people),
      Icon(Icons.person),
      Icon(Icons.star_rate),
      Icon(Icons.settings),
      Icon(Icons.schema),
      Icon(Icons.home_filled),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          index: pageNum,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (selectedIndex){
            setState(() {
              pageNum = selectedIndex;
            });
          },
          color: Color.fromRGBO(22, 49, 99, 0.9),
          backgroundColor: Colors.transparent,
          height: 60,
          items: tabs,
        ),
      ),
      body: pages[pageNum],
    );
  }
}

