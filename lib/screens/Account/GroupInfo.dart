import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:another_flushbar/flushbar.dart';

final logger = Logger();

class GroupInfoPage extends StatefulWidget {
  final Groupinfo group;
  const GroupInfoPage({Key? key, required this.group}) : super(key: key);

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {

  ///
  /// МБ кнопку скачивания эксельки добавить
  ///

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: 1, // or whatever offset you wish
      keepScrollOffset: true,
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: const [
              Text(
                'Группа',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.black, // Цвет иконки
          ),
        ),
        body: Builder(
          builder: (context) {
            return Column(

              children: [
                  // Text('Группа: ${group.numberOfGroup} \n '
                  //     '${group.groupInfoStudentDto![0].fio} \n'
                  //     'Контакты: ${group.groupInfoStudentDto![0].phone},${group.groupInfoStudentDto![0].email}',
                  //   style: TextStyle(fontSize: 20) ,),
                Expanded(
                  child: ListView.builder(
                      itemCount: (widget.group.groupInfoStudentDto!.length-1),
                      itemBuilder: (cont,index)
                          {
                              return Container(
                                //height: 120,
                                child: Card(
                                  color: getcorlor(widget.group.groupInfoStudentDto![index].position!),
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
                                        Text('${widget.group.groupInfoStudentDto![index].position != null && widget.group.groupInfoStudentDto![index].position != "" ? '${widget.group.groupInfoStudentDto![index].position!}: ' : ''}${widget.group.groupInfoStudentDto![index].fio!}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),),
                                        const SizedBox(height: 8,),
                                        Row(children: [IconButton(onPressed: () async {
                                          await launch("tel://${widget.group.groupInfoStudentDto![index].phone!}");
                                        }, icon: Icon(Icons.phone)),Text('${widget.group.groupInfoStudentDto![index].phone!}')]),
                                        const SizedBox(height: 4,),
                                        Row(children: [IconButton(onPressed: () async  {
                                          await Clipboard.setData(ClipboardData(text: widget.group.groupInfoStudentDto![index].email!)).then((_){
                                            //logger.d(ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email address copied to clipboard"))));
                                            Flushbar(
                                              backgroundColor: Theme.of(context).cardColor,
                                              messageColor: Theme.of(context).hintColor,
                                              message: "Адресс скопирован в буфер обмена",
                                              icon: Icon(
                                                Icons.notifications,
                                                size: 28.0,
                                                color:Theme.of(context).hintColor,
                                              ),
                                              duration: Duration(seconds: 1),
                                              isDismissible: true,
                                            )..show(context);
                                          });
                                        }, icon: Icon(Icons.mail)),Text('${widget.group.groupInfoStudentDto![index].email!}')]),
                                        const SizedBox(height: 20,),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }
                  ),
                )
              ],
            );
          }
        ),
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