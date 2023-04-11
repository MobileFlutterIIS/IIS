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
    return Column(

      children: [
          // Text('Группа: ${group.numberOfGroup} \n '
          //     '${group.groupInfoStudentDto![0].fio} \n'
          //     'Контакты: ${group.groupInfoStudentDto![0].phone},${group.groupInfoStudentDto![0].email}',
          //   style: TextStyle(fontSize: 20) ,),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: (group.groupInfoStudentDto!.length-1),
                padding: const EdgeInsets.all(8),
                itemBuilder: (context,index)
                    {
                        return Container(
                          height: 100,
                          child: Card(
                             color: getcorlor(group.groupInfoStudentDto![index].position!),
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${group.groupInfoStudentDto![index].position != null && group.groupInfoStudentDto![index].position != "" ? '${group.groupInfoStudentDto![index].position!}: ' : ''}${group.groupInfoStudentDto![index].fio!}'),
                                Text('${group.groupInfoStudentDto![index].phone!}'),
                                Text('${group.groupInfoStudentDto![index].email!}'),
                              ],
                            ),
                          ),
                        );
                    }
            ),
          ),
        )
      ],
    );
  }
}

Color getcorlor(String? pos)
{
  if (pos != null)
  {
    if (pos! == 'Куратор') return Colors.yellowAccent;
    if (pos! == 'Староста группы') return Colors.greenAccent;
  }
  return Colors.white;
}