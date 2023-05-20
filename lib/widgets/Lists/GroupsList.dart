import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';
import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';


ListView buildGroups(BuildContext context, List<Group> groups) {
  return ListView.builder(
    itemCount: groups.length,
    padding: const EdgeInsets.all(8),
    itemBuilder: (context,index){
      return
        Container(
          height: 120,
          child:
          GestureDetector (
            // onTap: () {
            //   showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return createdialog(groups[index]);
            //       }
            //   );
            // },
            onTap: () async{
              await ManagerClass.getGroupsScheduleToBase(groups![index].name!);
              Navigator.pop(context);
            },
            child: Card(
                //color: Colors.black12,
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),

                child:
                Row(
                    children: <Widget>[
                      const SizedBox(width: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child:
                        Image.asset('images/pepo.png', width: 80, height: 80),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: <Widget>[

                          Container(
                            width: 250 ,
                            height: 100,
                            child :
                            Center (
                              child: ListTile(
                                title: Text(
                                  "${groups[index].name}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'NotoSerif',
                                    ),
                                ),
                                subtitle: Text(
                                  groups[index].specialityName!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'NotoSerif',
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ]
                )
            ),
          ),
        );
    },
  );
}

AlertDialog createdialog (Group post)
{
  return AlertDialog(
    backgroundColor: Colors.grey[900],
    scrollable: true,
    title: Text(post.name!, style: const TextStyle(color: Colors.white, fontSize: 20),),
    content:
    Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Column
        (
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:
            Image.asset('images/pepo.png', width: 80, height: 80),
          ),
          const SizedBox(height: 20,),
          Text('${post.name} \n'
              '${post.facultyName} \n'
              '${post.specialityName}\n'),
        ],
      ),
    ),
  );
}
