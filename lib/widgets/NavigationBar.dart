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
  double height = 60;
  double boxheight = 30;
  bool arrowup = true;


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
      IconButton(icon: Icon(Icons.schedule),onPressed: () {setState(() {pageNum = 0;});},),
      IconButton(icon: Icon(Icons.book),onPressed: () {setState(() {pageNum = 1;});},),
      IconButton(icon: Icon(Icons.people),onPressed: () {setState(() {pageNum = 2;});},),
      IconButton(icon: Icon(Icons.person),onPressed: () {setState(() {pageNum = 3;});},),
      IconButton(icon: Icon(Icons.star_rate),onPressed: () {setState(() {pageNum = 4;});},),
      IconButton(icon: Icon(Icons.settings),onPressed: () {setState(() {pageNum = 5;});},),
      IconButton(icon: Icon(Icons.schema),onPressed: () {setState(() {pageNum = 6;});},),
      IconButton(icon: Icon(Icons.home_filled),onPressed: () {setState(() {pageNum = 7;});},),
      IconButton(icon: Icon(Icons.phone),onPressed: () {setState(() {pageNum = 8;});},),
    ];
    return GestureDetector(
      // onPanUpdate: (details) {
      //   int sensitivity = 1;
      //   if (details.delta.dy < -sensitivity) {
      //     setState(() {
      //       height=120;
      //       boxheight = 0;
      //       arrowup = false;
      //     });
      //   }
      //   if (details.delta.dy >sensitivity ) {
      //     setState(() {
      //       height=60;
      //       boxheight = 30;
      //       arrowup = true;
      //     });
      //   }
      // },
      onTap: () {
        setState(() {
          height = arrowup ? 120 : 60;
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: tabs.getRange(0, 4).toList(),
                        ),
                        AnimatedContainer(curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 500),
                            height: boxheight,child : SizedBox()),
                        Row
                          (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: tabs.getRange(5, 9).toList(),
                        ),
                        const SizedBox(height: 20,)
                      ],
                    ),
                  )
                ),
              ),
                Positioned(width: MediaQuery.of(context).size.width, child: AnimatedSwitcher
                  (
                  duration: const Duration(milliseconds: 500),
                  child: Icon(arrowup ? (Icons.keyboard_arrow_up_outlined) : (Icons.keyboard_arrow_down_outlined)),
                )),
              ]
            ),
          ),
        ),
        body: Pages()[pageNum],
      ),
    );
  }

}


