import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iis/data/ScheduleAndListManagement/ManagerClass.dart';

ListView buildPosts(BuildContext context, List<Post> posts) {
  return ListView.builder(
    itemCount: posts.length,
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
            //         return createdialog(posts[index]);
            //       }
            //   );
            // },
            onTap: () async
            {
              await ManagerClass.getTutorScheduleToBase(posts![index]);
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
                        CachedNetworkImage(
                          width: 80, height: 80,
                          imageUrl: posts[index].photoLink!,
                          placeholder: (context, url) => Image.asset('images/pepo.png', width: 80, height: 80),
                          errorWidget: (context, url, error) => Image.asset('images/pepo.png', width: 80, height: 80),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: <Widget>[

                          Container(
                            width: 200 ,
                            height: 100,
                            child :
                            Center (
                              child: ListTile(
                                title: Text(
                                  "${posts[index].firstName} ${posts[index].middleName} ${posts[index].lastName}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'NotoSerif',
                                  ),
                                ),
                                subtitle: Text(
                                  posts[index].rank ?? '',
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

AlertDialog createdialog (Post post)
{
  return AlertDialog(
    backgroundColor: Colors.grey[900],
    scrollable: true,
    title: Text(post.fio!, style: const TextStyle(color: Colors.white, fontSize: 20),),
    content:
    Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Column
        (
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),

            child:
            CachedNetworkImage(
              width: 120, height: 120,
              imageUrl: post.photoLink!,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset('images/pepo.png', width: 80, height: 80),
            ),
          ),
          const SizedBox(height: 20,),
          Text('${post.firstName} ${post.middleName} ${post.lastName} \n'
              '${post.rank ?? ''} ${post.rank != null? '\n': ''}'
              '${post.academicDepartment}\n', style: const  TextStyle(color: Colors.white),),
        ],
      ),
    ),
  );
}
