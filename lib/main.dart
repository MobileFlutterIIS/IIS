import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iis/widgets/NavigationBar.dart';
import 'package:dio/dio.dart';
import 'package:iis/data/HiveDatabase.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

 void main() async {
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
          primary: const Color.fromRGBO(22, 49, 99, 0.9),
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
  Color backgroundcolor = Colors.white;
  Color primarycolor = const Color.fromRGBO(20, 31, 51, 0.9);
  Color? between;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundcolor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text('И И C    "Б Г У И Р"'),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.sunny, color: Colors.white,),
                onPressed: () {
                  setState(() {
                    between = backgroundcolor;
                    backgroundcolor = primarycolor;
                    primarycolor = between!;
                  });

                },
              ),
            ],
          ),
        ),


         bottomNavigationBar: SizedBox(
           height: MediaQuery.of(context).size.height - 100,
           child: NavBar(backgroundcolor: backgroundcolor, primarycolor: primarycolor,),
         ),
      ),
    );
  }
}



