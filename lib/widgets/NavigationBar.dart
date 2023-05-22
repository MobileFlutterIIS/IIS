import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iis/screens/Account/Dormitory.dart';
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
import 'package:iis/screens/Support/SupportScreen.dart';


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
      Support(),
    ];
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      Column(children: [IconButton(icon: Icon(Icons.schedule),onPressed: () {collapse();setState(() {pageNum = 0;});},), AnimatedOpacity(child: Text('Расписание',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.book),onPressed: () {collapse();setState(() {pageNum = 1;});},), AnimatedOpacity(child: Text('Дисциплины',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.people),onPressed: () {collapse();setState(() {pageNum = 2;});},), AnimatedOpacity(child: Text('Студенты',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.person),onPressed: () {collapse();setState(() {pageNum = 3;});},), AnimatedOpacity(child: Text('Аккаунт',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.star_rate),onPressed: () {collapse(); setState(() {pageNum = 4;} );},), AnimatedOpacity(child: Text('Рейтинг',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.settings),onPressed: () {collapse();setState(() {pageNum = 5;});},), AnimatedOpacity(child: Text('Найстройки',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.schema),onPressed: () {collapse();setState(() {pageNum = 6;});},), AnimatedOpacity(child: Text('Расписание Кафедр',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.home_filled),onPressed: () {collapse();setState(() {pageNum = 7;});},), AnimatedOpacity(child: Text('Подразделения',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.phone),onPressed: () {collapse();setState(() {pageNum = 8;});},), AnimatedOpacity(child: Text('Справочник',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
      Column(children: [IconButton(icon: Icon(Icons.help_outline),onPressed: () {collapse();setState(() {pageNum = 9;});},), AnimatedOpacity(child: Text('Поддержка',style: TextStyle(fontSize: 10),) ,opacity: textvisible? 1.0: 0.0, duration: Duration(milliseconds: 500))]),
    ];
    return GestureDetector(
      onPanUpdate: (details) {
        int sensitivity = 1;
        if (details.delta.dy < -sensitivity)
          open();
        if (details.delta.dy >sensitivity )
          collapse();
      },
      // onTap: () {
      //   setState(() {
      //     height = arrowup ? 120 : 60;
      //     boxheight = arrowup ? 0 : 30;
      //     arrowup = !arrowup;
      //   });
      // },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          children: tabs.getRange(4, 9).toList(),
                          ),
                        SizedBox(height: 20,),
                        Row
                          (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: tabs.getRange(9, 10).toList(),
                         ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  )
                ),
              ),
                Positioned(width: MediaQuery.of(context).size.width, child: AnimatedSwitcher
                  (
                  duration: const Duration(milliseconds: 500),
                  child: IconButton(icon: Icon(arrowup ? (Icons.keyboard_arrow_up_outlined) : (Icons.keyboard_arrow_down_outlined)),
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
        body: Pages()[pageNum],
      ),
    );
  }

}


