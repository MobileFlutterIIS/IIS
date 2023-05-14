import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/DIsciplinesApi/disciplineapi.dart';
import 'package:iis/services/DIsciplinesApi/DisciplineManager.dart';
import 'package:iis/services/StudentsApi/StudentsManager.dart';
import 'package:iis/services/StudentsApi/studentsapi.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:logger/logger.dart';
import 'package:iis/screens/Students/StudentsList.dart';

final logger = Logger();


///
/// Если тут делать дизайн, гуглить это
/// https://pub.dev/packages/multi_select_flutter
///
class Students extends StatefulWidget{
  Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {

  static List<Skill>? Skills;
  static List<Speciality>? Faculties;
  static List<int> Courses =[1,2,3,4,5,6];

  static bool searchjob = false;
  static String? Secondname;
  static List<int> SelectedFaculties =[];
  static List<Skill> SelectedSkills = [];
  static List<int> SelectedCourses = [];

  Future<bool> initialize() async
  {
    if (Faculties == null || Faculties!.isEmpty)
      Faculties = await RatingManager.GetFaculty();
    Skills = await StudentManager.GetSkills("");
    logger.d(Faculties);
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    //backgroundColor: widget.backgroundcolor,
    body: FutureBuilder(
      future: initialize(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData && snapshot != null)
          return CircularProgressIndicator();
        return SafeArea(
          child:
          Column
            (
            children: [
              Row(
                children: [
                  Checkbox(
                      value: searchjob,
                      onChanged: (bol){setState(() {
                    searchjob = bol!;
                  });}
                  ),
                  Text(
                      "Searchjob",
                  // style: TextStyle(
                  //   color: widget.primarycolor,
                  // ),
                  ),
                ],
              ),
                TextField(
                onSubmitted: (String value) async {
                  setState(() {
                    Secondname = value;
                  });
                }
                ),
              MultiSelectDialogField<int>(
                buttonText: Text(
                    'Faculties',
                  // style: TextStyle(
                  //   color: widget.primarycolor,
                  // ),
                ),
                searchable: true,
                title: Text(
                    'Faculties',
                  // style: TextStyle(
                  //   color: widget.primarycolor,
                  // ),
                ),
                items: Faculties!.map((e) => MultiSelectItem(e.id!, e.text!)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  SelectedFaculties = values;
                },
                chipDisplay: MultiSelectChipDisplay(
                  items: Faculties!.map((e) => MultiSelectItem(e.id!, e.text!)).toList(),
                 // onTap: (value) {
                 //     SelectedFaculties!.remove(value);
                 // },
                ),
              ),
              MultiSelectDialogField<int>(
                buttonText: Text(
                    'Courses',
                  // style: TextStyle(
                  //   color: widget.primarycolor,
                  // ),
                ),
                searchable: true,
                title: Text(
                    'Courses',
                  // style: TextStyle(
                  //   color: widget.primarycolor,
                  // ),
                ),
                items: Courses.map((e) => MultiSelectItem(e, e.toString())).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  SelectedFaculties = values;
                },
                chipDisplay: MultiSelectChipDisplay(
                  items: Courses.map((e) => MultiSelectItem(e, e.toString())).toList(),
                  // onTap: (value) {
                  //     SelectedFaculties!.remove(value);
                  // },
                ),
              ),
             Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Autocomplete<Skill>(
                       displayStringForOption: (Skill option) => option.name!,
                       optionsBuilder:(TextEditingValue textEditingValue) async
                       {
                         List<Skill>? list = await StudentManager.GetSkills(textEditingValue.text);
                         return list!;
                       },
                      onSelected: (Skill a)
                      {
                           setState(() {
                             SelectedSkills.add(a);
                           });
                      },
                   ),
                   MultiSelectChipDisplay(
                     items: SelectedSkills.map((e) => MultiSelectItem(e, e.name!)).toList(),
                     onTap: (value)
                     {
                       setState(() {
                         SelectedSkills.remove(value);
                       });
                     },
                   ),
                 ],
               ),
             ),
              FloatingActionButton(onPressed:
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentsList(searchjob: searchjob,
                      Secondname: Secondname, SelectedFaculties:
                      SelectedFaculties, SelectedSkills: SelectedSkills.map((e) => e!.id!).toList(),
                      SelectedCourses: SelectedCourses)),);
              }
              ),
            ],
          ),
        );
      },
    )
  );
}

