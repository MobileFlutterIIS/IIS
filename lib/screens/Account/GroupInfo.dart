import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';

class GroupInfoPage extends StatelessWidget {
  final Groupinfo group;
  const GroupInfoPage({Key? key, required this.group}) : super(key: key);

  ///
  /// МБ кнопку скачивания эксельки добавить
  ///

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: 1, // or whatever offset you wish
      keepScrollOffset: true,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[200],
        centerTitle: true,
        title: Text('Г Р У П П А'),
      ),
      body: Column(

        children: [
            // Text('Группа: ${group.numberOfGroup} \n '
            //     '${group.groupInfoStudentDto![0].fio} \n'
            //     'Контакты: ${group.groupInfoStudentDto![0].phone},${group.groupInfoStudentDto![0].email}',
            //   style: TextStyle(fontSize: 20) ,),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: (group.groupInfoStudentDto!.length-1),
                  itemBuilder: (context,index)
                      {
                          return Container(
                            height: 120,
                            child: Card(
                              color: getcorlor(group.groupInfoStudentDto![index].position!),
                              elevation: 4,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                                    Text('${group.groupInfoStudentDto![index].position != null && group.groupInfoStudentDto![index].position != "" ? '${group.groupInfoStudentDto![index].position!}: ' : ''}${group.groupInfoStudentDto![index].fio!}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),),
                                    const SizedBox(height: 8,),
                                    Text('${group.groupInfoStudentDto![index].phone!}'),
                                    const SizedBox(height: 4,),
                                    Text('${group.groupInfoStudentDto![index].email!}'),
                                    const SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ),
                          );
                      }
              ),
            ),
          )
        ],
      ),
    );
  }
}

Color getcorlor(String? pos)
{
  if (pos != null)
  {
    if (pos == 'Куратор') return Color.fromRGBO(168, 187, 199, 0.9);
    if (pos == 'Староста группы') return Color.fromRGBO(218, 226, 231, 0.9);
  }
  return Colors.white;
}