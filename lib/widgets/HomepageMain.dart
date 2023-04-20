import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iis/widgets/NavigationBar.dart';
import 'package:dio/dio.dart';
import 'package:iis/data/HiveDatabase.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

Future<void> main() async {
  final dio = Dio(); // Provide a dio instance
  dio.options.headers["Demo-Header"] = "demo header"; // config your dio headers globally
  final client = RestClient(dio);
  await HiveInjector.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(22, 49, 99, 0.9),
        ),

      ),
      home:
          const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBar(

            title: Text('И И C    "Б Г У И Р"'),
            centerTitle: true,
            elevation: 0,

          ),
        ),

        // body: Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 45,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20.0)
        //         ),
        //         child: TabBar(
        //           indicator: BoxDecoration(
        //             color: Color.fromRGBO(251, 150, 158, 0.9),
        //             borderRadius: BorderRadius.circular(25.0),
        //           ),
        //           labelColor: Colors.white,
        //           unselectedLabelColor: Colors.black,
        //           tabs: [
        //             Tab(text: 'Преподаватели'),
        //             Tab(text: 'Группы'),
        //           ],
        //         ),
        //       ),
        //       SizedBox.shrink(
        //           child: TabBarView(
        //             children: [
        //               Schedule(),
        //             ],
        //           ),
        //       ),
        //     ],
        //   ),
        // ),
         bottomNavigationBar: SizedBox(
           height: MediaQuery.of(context).size.height - 100,
           child: NavBar(),
         ),
      ),
    );
  }
}



