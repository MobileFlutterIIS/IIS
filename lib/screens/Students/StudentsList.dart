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

final logger = Logger();

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
  double cardheight = 50;
  int page = 1;
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
    final userspage = await StudentManager.GetStudentPage(
        widget.SelectedCourses, page+1,
        widget.SelectedFaculties, widget.Secondname,
        widget.searchjob, widget.SelectedSkills);
    setState(() {
      Visibleusers.addAll(userspage!.cvs!);
      //logger.d(Visibleusers);
      page+=1;
    });
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
      body: SafeArea(
        child: FutureBuilder(
          future: initialise(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData && snapshot != null)
              return CircularProgressIndicator();
            if (Visibleusers.length == 0) return Icon(Icons.accessible_sharp);
            return Container(
              color: Colors.black12,
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
                            color: Colors.black12,
                            child: Text('${Visibleusers[index].middleName!} ${Visibleusers[index].faculty!}',
                            style: TextStyle(color: Colors.black12),),),
                       );
                      }
                    else
                      {
                        if (Visibleusers.length <= MediaQuery.of(context).size.height/cardheight);
                        adddata();
                        return CircularProgressIndicator();
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
