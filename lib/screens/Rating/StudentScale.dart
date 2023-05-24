import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/screens/Account/GradeBookPage.dart';
import 'package:logger/logger.dart';

final logger = Logger();

/// TODO
/// SEARCH
///
/// TODO
/// БЕСКОНЕЧНО ГРУЗИТСЯ
///

class StudentScale extends StatefulWidget{
  // final Color backgroundcolor;
  // final Color primarycolor;
  StudentScale({super.key});
  @override
  State<StudentScale> createState() => _StudentScaleState();
}

class _StudentScaleState extends State<StudentScale> {

  TextEditingController controller = TextEditingController();
  static Student? student;
  static List<StudentsRating>? Studentratings;
  static List<StudentsRating>? Studentratingsvisible;
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
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: [
            const Text(
              'Рейтинг',
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
    //backgroundColor: widget.backgroundcolor,
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
             Row (
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<int>
                  (
                  hint: Text(
                      'Год',
                    // style: TextStyle(
                    //   color: widget.primarycolor,
                    // ),
                  ),
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
                ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButton<Speciality>
                  (
                  hint: Text(
                      'Факультет',
                    // style: TextStyle(
                    //   color: widget.primarycolor,
                    // ),
                  ),
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
              ),]
             ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButton<Speciality>
                  (
                  hint: Text(
                      'Специальность',
                    // style: TextStyle(
                    //   color: widget.primarycolor,
                    // ),
                  ),
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
                        temp!.sort((a,b) => b.average!.compareTo(a.average!));
                        for (int i =0; i < temp!.length;i++)
                          {
                            temp[i]!.index = i+1;
                          }
                        setState(() {
                          Studentratings = temp;

                          Studentratingsvisible =Studentratings;
                        });
                      }
                  },
                ),
              ),
              TextField(
                controller: controller,
                onChanged: (value)
                {
                  if (value == null || value == '') {setState(() {
                    Studentratingsvisible = Studentratings;
                  });}
                  else
                    {
                      List<StudentsRating> temp = [];
                      Studentratings!.forEach((element) { if (element.studentCardNumber!.toString().contains(value)) temp.add(element); });
                      setState(() {
                        Studentratingsvisible = temp;
                      });
                    }
                },
              ),
              Expanded(
                child: (Studentratings == null?
                Center(child: Icon(Icons.error_outline_rounded, ),):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('              № Студента                Средний балл         Часы',textAlign: TextAlign.left,),
                    Expanded(
                      child: ListView.builder(
                          itemCount: Studentratingsvisible!.length,
                          itemBuilder: (context, index)
                          {
                            bool neg = Studentratingsvisible![index].averageShift! < 0;
                              return GestureDetector(
                                onTap: () async{
                                  final temp = await RatingManager.GetStudentRating(Studentratingsvisible![index].studentCardNumber!);
                                  List<GradeBook> tempgradebook = [GradeBook(temp)];
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => GradeBookPage(gradebook: tempgradebook),),);
                                },
                                child: Card(
                                  child: Row(children:
                                  [
                                    Icon(Icons.person,),
                                    Text('${(Studentratingsvisible![index].index)}: ', style: TextStyle(fontSize: 20),),
                                    Text(Studentratingsvisible![index].studentCardNumber!, style: TextStyle(fontSize: 20), ),
                                    const SizedBox(width: 5,),
                                    Expanded(
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                      Row(
                                        children: [
                                          (neg? Icon(Icons.arrow_downward_outlined,color: Colors.red,) :Icon(Icons.arrow_upward_outlined,color: Colors.green,)),
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(text: '${Studentratingsvisible![index].average!}',style: TextStyle(color: Colors.black,fontSize: 20),),
                                              WidgetSpan(
                                                child: Transform.translate(
                                                  offset: const Offset(1, -6),
                                                  child: Text(
                                                      (neg? '': '+' )+Studentratingsvisible![index].averageShift!.toStringAsFixed(2),
                                                    style: TextStyle(color: neg? Colors.red: Colors.green,fontSize: 20),
                                                    //superscript is usually smaller in size
                                                    textScaleFactor: 0.7,
                                                  ),
                                                ),
                                              )
                                            ]),
                                          ),
                                        ],
                                      ),
                                      Text(Studentratingsvisible![index].hours!.toString(), style: TextStyle(fontSize: 20), ),
                                      ],),
                                    ),
                                  ],
                                  ),
                                ),
                              );
                          }
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        );
      }
    )
  );
}