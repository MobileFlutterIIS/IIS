import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/DIsciplinesApi/disciplineapi.dart';
import 'package:iis/services/DIsciplinesApi/DisciplineManager.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class DisciplinList extends StatefulWidget{
  @override
  State<DisciplinList> createState() => _DisciplinListState();
}

class _DisciplinListState extends State<DisciplinList> {

  static List<Discipline>? Disciplines;
  static List<Speciality>? Specialities;
  static List<Speciality>? Faculties;
  static List<int> Years = [2022,2021,2020,2019];


  static Speciality? dropdownSpecialities ;
  static Speciality? dropdownFaculty ;
  static int? dropdownYear;

  Future<bool> initialize() async
  {
    if (Faculties == null || Faculties!.isEmpty)
      Faculties = await RatingManager.GetFaculty();
    logger.d(Faculties);
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: FutureBuilder(
      future: initialize(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData && snapshot != null)
          return CircularProgressIndicator();
        logger.d(dropdownFaculty);
        logger.d(Faculties);
        return Column
          (
          children: [
            DropdownButton<int>
              (
              hint: Text('Year'),
              value: dropdownYear,
              items: Years.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (int? input) async {
                setState(() {
                  dropdownYear = input;
                });
                if (dropdownFaculty != null) {
                  Disciplines = null;
                  dropdownSpecialities = null;
                  final temp = await RatingManager.GetSpecialities(
                      dropdownFaculty!.id!, input!);
                  setState(() {
                    Specialities = temp;
                  });
                }
              },
            ),
            DropdownButton<Speciality>
              (
              hint: Text('Faculty'),
              value: dropdownFaculty,
              items: (Faculties != null ? Faculties!.map<
                  DropdownMenuItem<Speciality>>((Speciality value) {
                return DropdownMenuItem<Speciality>(
                  value: value,
                  child: Text(value.text!),
                );
              }).toList() : null),
              onChanged: (Speciality? input) async {
                setState(() {
                  dropdownFaculty = input;
                });
                if (dropdownYear != null) {
                  Disciplines = null;
                  dropdownSpecialities = null;
                  final temp = await RatingManager.GetSpecialities(
                      input!.id!, dropdownYear!);
                  setState(() {
                    Specialities = temp;
                  });
                }
              },
            ),
            DropdownButton<Speciality>
              (
              isExpanded: true,
              hint: Text('Speciality'),
              value: dropdownSpecialities,
              items: (Specialities != null ? Specialities!.map<
                  DropdownMenuItem<Speciality>>((Speciality value) {
                return DropdownMenuItem<Speciality>(
                  value: value,
                  child: Text(value.text!),
                );
              }).toList() : null),
              onChanged: (Speciality? input) async {
                setState(() {
                  dropdownSpecialities = input;
                  Disciplines = null;
                });
                if (dropdownYear != null) {
                  final temp = await DisciplineManager.GetDisciplines(input!.id!, dropdownYear!);
                  setState(() {
                    Disciplines = temp;
                    // Disciplines!.sort((a, b) =>
                    //     b.average!.compareTo(a.average!));
                  });
                }
              },
            ),
            Expanded(
              child: (Disciplines == null?
              Center(child: Icon(Icons.error_outline_rounded),):
              ListView.builder(
                  itemCount: Disciplines!.length,
                  itemBuilder: (context, index)
                  {
                      return Card(
                        child: Row
                          (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                        [
                          Icon(Icons.book,color: Colors.black12,),
                          Container(width: 200,child:Text(Disciplines![index].name!)),
                          Text(Disciplines![index].hours!.toString()),
                        ],
                        ),
                      );
                  }
              )),
            ),
          ],
        );
      }
      ),
    );
}