import 'package:flutter/material.dart';
import 'package:iis/services/RatingApi/RatingManager.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/DIsciplinesApi/disciplineapi.dart';
import 'package:iis/services/DIsciplinesApi/DisciplineManager.dart';
import 'package:logger/logger.dart';

final logger = Logger();

/// TODO CHOICE

class DisciplinList extends StatefulWidget {
  DisciplinList({super.key});

  @override
  State<DisciplinList> createState() => _DisciplinListState();
}

class _DisciplinListState extends State<DisciplinList> {
  static List<Discipline>? Disciplines;
  static List<Speciality>? Specialities;
  static List<Speciality>? Faculties;
  static List<int> Years = [2022, 2021, 2020, 2019];

  static Speciality? dropdownSpecialities;

  static Speciality? dropdownFaculty;

  static int? dropdownYear;

  Future<bool> initialize() async {
    if (Faculties == null || Faculties!.isEmpty)
      Faculties = await RatingManager.GetFaculty();
    logger.d(Faculties);
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: [
              const Text(
                'Перечень дисциплин',
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
        body: FutureBuilder(
            future: initialize(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData && snapshot != null)
                return CircularProgressIndicator();
              logger.d(dropdownFaculty);
              logger.d(Faculties);
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.26,
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
                        child: DropdownButton<int>(
                          hint: const Center(
                            child: Text(
                              'Год',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'NotoSerif',
                              ),
                            ),
                          ),
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
                      ),
                      const SizedBox(
                        width: 10,
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
                        child: DropdownButton<Speciality>(
                          hint: const Center(
                            child: Text(
                              'Факультет',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'NotoSerif',
                              ),
                            ),
                          ),
                          value: dropdownFaculty,
                          items: (Faculties != null
                              ? Faculties!.map<DropdownMenuItem<Speciality>>(
                                  (Speciality value) {
                                  return DropdownMenuItem<Speciality>(
                                    value: value,
                                    child: Text(value.text!),
                                  );
                                }).toList()
                              : null),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
                    child: DropdownButton<Speciality>(
                      isExpanded: true,
                      hint: const Center(
                        child: Text(
                          'Специальность',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                      ),
                      value: dropdownSpecialities,
                      items: (Specialities != null
                          ? Specialities!.map<DropdownMenuItem<Speciality>>(
                              (Speciality value) {
                              return DropdownMenuItem<Speciality>(
                                value: value,
                                child: Text(value.text!),
                              );
                            }).toList()
                          : null),
                      onChanged: (Speciality? input) async {
                        setState(() {
                          dropdownSpecialities = input;
                          Disciplines = null;
                        });
                        if (dropdownYear != null) {
                          final temp = await DisciplineManager.GetDisciplines(
                              input!.id!, dropdownYear!);
                          setState(() {
                            Disciplines = temp;
                            // Disciplines!.sort((a, b) =>
                            //     b.average!.compareTo(a.average!));
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: (Disciplines == null
                        ? const Center(
                            child: Icon(Icons.error_outline_rounded),
                          )
                        : ListView.separated(
                            itemCount: Disciplines!.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.book),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              Disciplines![index].name!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'NotoSerif',
                                              ),
                                            ),
                                          ),
                                          Text(
                                            Disciplines![index]
                                                .hours!
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'NotoSerif',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                  ),
                ],
              );
            }),
      );
}
