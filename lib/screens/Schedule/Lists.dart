import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';
import 'package:iis/widgets/Lists/TutorsList.dart';
import 'package:iis/widgets/Lists/GroupsList.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final logger = Logger();

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _HomeState();
}

class _HomeState extends State<Lists> {
  TextEditingController editingController= TextEditingController();
  List contents = [];
  List dublicates = [];



  Future<void> setgroups() async
  {
    List<Group> temp = await ManagerClass.getGroups() as List<Group>;
    setState(()  {
      contents.clear();
      dublicates.clear();
      contents.addAll(temp as List<Group>);
      dublicates.addAll(contents);
    });
  }
  Future<void> setposts() async
  {
    List<Post> temp = await ManagerClass.getPosts() as List<Post>;
    setState(()  {
      contents.clear();
      dublicates.clear();
      contents.addAll(temp as List<Post>);
      dublicates.addAll(contents);
    });
  }

  @override
    void initState()  {
    setgroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ValueListenableBuilder(
        valueListenable: Hive.box('_tutorsBox').listenable(),
        builder: (context,box,_) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Colors.black, // Цвет иконки
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0746,
            leading: IconButton(icon :const Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },),
            title: TextField(
            onChanged: (value) async {
              List dummy = [];
              dummy.addAll(dublicates);
              logger.d('creating list on prompt ${value.toLowerCase()}');
              String t = value.toLowerCase();
              t.replaceAll(' ', '');
              if (t.isNotEmpty)
                {
                  List temp = [];
                  dummy.forEach((item)
                  {
                  if (item is Post) {
                    String fullname = '${item.firstName!.toLowerCase()}${item
                        .middleName!.toLowerCase()}${item.lastName!
                        .toLowerCase()}';
                    fullname.toLowerCase();
                    if (fullname.contains(t)) {
                      temp.add(item);
                    }
                  }
                  else
                    if (item is Group)
                    {
                      String fullname = item.name!;
                      fullname.toLowerCase();
                      if (fullname.contains(t)) {
                        temp.add(item);
                      }
                    }
                  });
                  setState(() {
                    contents.clear();
                    contents.addAll(temp);

                  });
                }
              else {
                setState(() {
                  contents.clear();
                  contents.addAll(dublicates);

                });
              }
            },
            controller: editingController,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'NotoSerif',
            ),
            decoration: const InputDecoration(
            labelText: "Search",
            labelStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'NotoSerif',
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            border: OutlineInputBorder(),
            ),
          ),
          ),

          body: Column(
            children: <Widget>[
              const SizedBox (height: 8),
              Row(
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.8, // Adjust the value to make the buttons narrower
                      child: ElevatedButton(
                        onPressed: () {
                          setposts();
                        },
                        child: const Text(
                            'Преподаватели',
                          style: TextStyle(
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.8, // Adjust the value to make the buttons narrower
                      child: ElevatedButton(
                        onPressed: () {
                          setgroups();
                        },
                        child: const Text(
                            'Группы',
                          style: TextStyle(
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             const SizedBox (height: 5),
             Expanded(
                child : Builder(
                  builder: (BuildContext context)
                  {
                    if (contents.isNotEmpty) {
                      if (contents[0] is Group)
                      return buildGroups(context, contents.cast());
                      else
                      return buildPosts(context, contents.cast());
                    }
                    else {
                      return const Icon(Icons.error_outline_rounded);
                    }
                  },
                )
             ),
            ],
          ),
        ),
      );

  }
}

// https://stackoverflow.com/questions/49771765/flutter-default-image-to-image-network-when-it-fails


