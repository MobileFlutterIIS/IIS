import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iis/pages/additional/AdditionalFunctions.dart';
import 'package:iis/pages/schedulechoice/ChooseSchedule.dart';
import 'package:iis/pages/disciplinlist/DisciplinList.dart';
import 'package:iis/pages/studentscale/StudentScale.dart';
import 'package:iis/pages/userlogin/UserLogin.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _MyNavBar();
}

class _MyNavBar extends State<NavBar> {
  int pageNum = 0;
  final pages = [
    ChooseSchedule(),
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

// Container (
// color: Color.fromRGBO(251, 150, 158, 0.9),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 5.0,
// vertical: 1.5,
// ),
// child: GNav(
// gap: 4,
// padding: EdgeInsets.all(18),
// backgroundColor: Color.fromRGBO(251, 150, 158, 0.9),
// tabBackgroundColor: Color.fromRGBO(214, 112, 120, 0.9),
// color: Colors.white,
// activeColor: Colors.white,
// tabs: const [
// GButton(
// icon: Icons.schedule,
// text: 'Расписание',
// ),
// GButton(
// icon: Icons.book,
// text: 'Зачётка',
// ),
// GButton(
// icon: Icons.rate_review,
// text: 'Рейтинг',
// ),
// GButton(
// icon: Icons.settings,
// text: 'Ещё',
// ),
// ],
// ),
// ),
// ),