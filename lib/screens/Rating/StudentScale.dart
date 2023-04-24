import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/screens/Account/GradeBookPage.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class StudentScale extends StatefulWidget{
  @override
  State<StudentScale> createState() => _StudentScaleState();
}

class _StudentScaleState extends State<StudentScale> {

  static Student? student;
  static List<StudentsRating>? Studentratings;
  static List<Speciality>? Specialities;
  static List<Speciality>? Faculties;
  static List<int> Years = [2022,2021,2020,2019];

  static Speciality? dropdownSpecialities ;
  static Speciality? dropdownFaculty ;
  static int? dropdownYear;
  //static String? dropdownSpecialityRating;

  Future<bool> initializeTEST() async
  {
    Studentratings = await RatingManager.GetSpecialityRating(2022,20021);
    logger.d(Studentratings);
    Specialities = await RatingManager.GetSpecialities(20026,2022);
    //dropdownSpecialities = Specialities![0].text!;
    logger.d(Specialities);
    Faculties = await RatingManager.GetFaculty();
    logger.d(Faculties);
    student = await RatingManager.GetStudentRating("25350111");
    logger.d(student);
    return true;
  }

  /// МБ сюда потом добавить определение года но пака этого не будет ))
  Future<bool> initialize() async
  {
    if (Faculties == null || Faculties!.isEmpty)
    Faculties = await RatingManager.GetFaculty();
    logger.d(Faculties);
    return true;
  }

  @override
  void initState() {
    //initializeTEST();
    //initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: FutureBuilder(
      future: initialize(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData && snapshot != null) return CircularProgressIndicator();
        logger.d(dropdownFaculty);
        logger.d(Faculties);
       return SafeArea(
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<int>
                (
                hint: Text('Year'),
                value: dropdownYear,
                items: Years.map<DropdownMenuItem<int>>((
                    int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? input) async {
                  setState(()  {
                    dropdownYear = input;
                  });
                  if (dropdownFaculty != null) {
                    Studentratings = null;
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
                items: (Faculties != null ? Faculties!.map<DropdownMenuItem<Speciality>>((
                    Speciality value) {
                  return DropdownMenuItem<Speciality>(
                    value: value,
                    child: Text(value.text!),
                  );
                }).toList(): null),
                onChanged: (Speciality? input) async {
                  setState(() {
                    dropdownFaculty = input;
                  });
                  if (dropdownYear != null) {
                    Studentratings = null;
                    dropdownSpecialities = null;
                    final temp = await RatingManager.GetSpecialitiesDayOnly(
                        input!.id!, dropdownYear!);
                    setState(() {
                      Specialities = temp;
                    });
                  }
                },
              ),
              DropdownButton<Speciality>
                (
                hint: Text('Speciality'),
                value: dropdownSpecialities,
                items: (Specialities != null ? Specialities!.map<DropdownMenuItem<Speciality>>((
                    Speciality value) {
                  return DropdownMenuItem<Speciality>(
                    value: value,
                    child: Text(value.text!),
                  );
                }).toList(): null),
                onChanged: (Speciality? input) async{
                  setState(()  {
                    dropdownSpecialities = input;
                  });
                  if (dropdownYear != null)
                    {
                      final temp = await RatingManager.GetSpecialityRating(dropdownYear!,dropdownSpecialities!.id!);
                      setState(() {
                        Studentratings = temp;
                        Studentratings!.sort((a,b) => b.average!.compareTo(a.average!));
                      });
                    }
                },
              ),
              Expanded(
                child: (Studentratings == null?
                Center(child: Icon(Icons.error_outline_rounded),):
                ListView.builder(
                    itemCount: Studentratings!.length,
                    itemBuilder: (context, index)
                    {
                        return GestureDetector(
                          onTap: () async{
                            final temp = await RatingManager.GetStudentRating(Studentratings![index].studentCardNumber!);
                            List<GradeBook> tempgradebook = [GradeBook(temp)];
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => GradeBookPage(gradebook: tempgradebook),),);
                          },
                          child: Card(
                            child: Row(children:
                            [
                              Icon(Icons.person,color: Colors.black12,),
                              Text(Studentratings![index].studentCardNumber!),
                              SizedBox(width: 5,),
                              Text(Studentratings![index].average!.toString()),
                              SizedBox(width: 5,),
                              Text(Studentratings![index].averageShift!.toString()),
                            ],
                            ),
                          ),
                        );
                    }
                )),
              ),
            ],
          ),
        );
      }
    )
  );
}