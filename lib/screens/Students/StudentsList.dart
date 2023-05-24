import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/DIsciplinesApi/disciplineapi.dart';
import 'package:iis/services/DIsciplinesApi/DisciplineManager.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';
import 'package:iis/services/StudentsApi/StudentsManager.dart';
import 'package:iis/services/StudentsApi/studentsapi.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:logger/logger.dart';
import 'package:cached_network_image/cached_network_image.dart';

final logger = Logger();

///
/// TODO
/// ADD more info
///
///

class StudentsList extends StatefulWidget {
  final bool searchjob;
  final String? Secondname;
  final List<int> SelectedFaculties;
  final List<int> SelectedSkills;
  final List<int> SelectedCourses;
  const StudentsList({Key? key,
    required this.searchjob,
    required this.Secondname,
    required this.SelectedFaculties,
    required this.SelectedSkills,
    required this.SelectedCourses,
  }) : super(key: key);

  @override
  State<StudentsList> createState() => _StudentsListState();

}

class _StudentsListState extends State<StudentsList> {
  final controller = ScrollController();
  double cardheight = 100;
  int page = 1;
  int maxpages = 1;
  List<UserEntity> Visibleusers =[];

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset)
        {
          adddata();
        }
    });
    page = 1;
    super.initState();
  }

  Future adddata() async{
    if (page < maxpages) {
      final userspage = await StudentManager.GetStudentPage(
          widget.SelectedCourses, page + 1,
          widget.SelectedFaculties, widget.Secondname,
          widget.searchjob, widget.SelectedSkills);
      setState(() {
        Visibleusers.addAll(userspage!.cvs!);
        //logger.d(Visibleusers);
        page += 1;
      });
    }
  }

  Future<bool> initialise() async
  {
    if(Visibleusers.isEmpty) {
      final userspage = await StudentManager.GetStudentPage(
          widget.SelectedCourses, page,
          widget.SelectedFaculties, widget.Secondname,
          widget.searchjob, widget.SelectedSkills);
      Visibleusers.addAll(userspage!.cvs!);
      //logger.d(userspage.cvs! as List<UserEntity>);
      logger.d(MediaQuery.of(context).size.height / cardheight);
      maxpages = userspage.totalPages!;
    }
    return true;
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        title: Row(
          children: [
            const Text(
              'Студенты',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.34,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black, // Цвет иконки
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: initialise(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData && snapshot != null)
              return CircularProgressIndicator();
            if (Visibleusers.length == 0) return const Icon(Icons.accessible_sharp);
            return Container(
              //color: Colors.black12,
              child: ListView.builder(
                controller: controller,
                itemCount: Visibleusers.length+1,
                  itemBuilder: (context,index)
                  {
                    if (index < Visibleusers.length)
                      {
                       return Container(
                         height: cardheight,
                         child: Card(
                            //color: Colors.black12,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child:
                                  CachedNetworkImage(
                                    fit: BoxFit.fitWidth,
                                    width: 100, height: 100,
                                    imageUrl: (Visibleusers[index].photoUrl != null? Visibleusers[index].photoUrl!: 'asd') ,
                                    placeholder: (context, url) => Image.asset('images/pepo.png', width: 100, height: 100,fit: BoxFit.fitWidth,),
                                    errorWidget: (context, url, error) => Image.asset('images/pepo.png', width: 100, height: 100,fit: BoxFit.fitWidth,),
                                  ),
                                ),
                               SizedBox(width: 5,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("${Visibleusers[index].firstName} ${Visibleusers[index].middleName} ${Visibleusers[index].lastName}",
                                       style: const TextStyle(
                                         color: Colors.black,
                                         fontFamily: 'NotoSerif',
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     Text("${Visibleusers[index].faculty}, ${Visibleusers[index].speciality}",
                                       style: const TextStyle(
                                         color: Colors.grey,
                                         fontFamily: 'NotoSerif',
                                       ),
                                     ),
                                     Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Visibleusers[index].rating! >= 1
                                             ?Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Color.fromRGBO(255, 180, 0, 0.9),
                                         )
                                             :Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Colors.grey[350],
                                         ),
                                         const SizedBox(width: 5),
                                         Visibleusers[index].rating! >= 2
                                             ?Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Color.fromRGBO(255, 180, 0, 0.9),
                                         )
                                             :Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Colors.grey[350],
                                         ),
                                         const SizedBox(width: 5),
                                         Visibleusers[index].rating! >= 3
                                             ?Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Color.fromRGBO(255, 180, 0, 0.9),
                                         )
                                             :Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Colors.grey[350],
                                         ),
                                         const SizedBox(width: 5),
                                         Visibleusers[index].rating! >= 4
                                             ?Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Color.fromRGBO(255, 180, 0, 0.9),
                                         )
                                             :Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Colors.grey[350],
                                         ),
                                         const SizedBox(width: 5),
                                         Visibleusers[index].rating! >= 5
                                             ?Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Color.fromRGBO(255, 180, 0, 0.9),
                                         )
                                             :Icon(
                                           Icons.filter_vintage,
                                           size: 10,
                                           color: Colors.grey[350],
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),

                              ],
                            )

                           ),
                       );
                      }
                    else
                      {
                        if (page == maxpages) return SizedBox();
                        if (Visibleusers.length <= MediaQuery.of(context).size.height/cardheight);
                        adddata();
                        return const CircularProgressIndicator();
                      }
                  }
              ),
            );
          }
        ),
      ),
    );
  }
}
