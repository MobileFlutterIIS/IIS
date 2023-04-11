import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iis/screens/AdditionalFunctions.dart';
import 'package:iis/screens/DisciplinList.dart';
import 'package:iis/screens/StudentScale.dart';
import 'package:iis/screens/Account/UserLogin.dart';
import 'package:iis/screens/Account/AccountPage.dart';
import 'package:iis/screens/Schedule/NavigationBetween.dart';

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
    UserLogin(),
    StudentScale(),
    AdditionalFunctions(),
  ];
  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      Icon(Icons.schedule),
      Icon(Icons.book),
      Icon(Icons.person),
      Icon(Icons.star_rate),
      Icon(Icons.settings)
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
          color: Color.fromRGBO(251, 150, 158, 0.9),
          backgroundColor: Colors.transparent,
          height: 60,
          items: tabs,
        ),
      ),
      body: pages[pageNum],
    );
  }
}

