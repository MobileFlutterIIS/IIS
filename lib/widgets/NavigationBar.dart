import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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

class NavBar extends StatefulWidget {
  const NavBar({Key? key});
  @override
  State<NavBar> createState() => _MyNavBar();
}

class _MyNavBar extends State<NavBar> {

  int pageNum = 0;


  List<Widget> Pages() {
    List<Widget> pages = [
      NavigationScreen(),
      DisciplinList(),
      Students(),
      UserLogin(),
      StudentScale(),
      AdditionalFunctions(),
      ScheduleDepartment(),
      Departments(),
      Phonebook(),
    ];
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      const Icon(Icons.schedule),
      const Icon(Icons.book),
      const Icon(Icons.people),
      const Icon(Icons.person),
      const Icon(Icons.star_rate),
      const Icon(Icons.settings),
      const Icon(Icons.schema),
      const Icon(Icons.home_filled),
      const Icon(Icons.phone),
    ];
    return Scaffold(

      //backgroundColor: widget.backgroundcolor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          index: pageNum,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (selectedIndex){
            setState(() {
              pageNum = selectedIndex;
            });
          },
          color: const Color.fromRGBO(22, 49, 99, 0.9),
          backgroundColor: Colors.transparent,
          height: 60,
          items: tabs,
        ),
      ),
      body: Pages()[pageNum],
    );
  }
}

