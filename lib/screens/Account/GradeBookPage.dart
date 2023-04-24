import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/LessonDto.dart';

class GradeBookPage extends StatefulWidget{
  final List<GradeBook> gradebook;
  const GradeBookPage({Key? key, required this.gradebook}) : super(key: key);

  @override
  State<GradeBookPage> createState() => _GradeBookPageState();
}

class _GradeBookPageState extends State<GradeBookPage> {

  List<GradeBook> _sortGradeBookByDate(List<GradeBook> gradebook) {
    gradebook.sort((a, b) =>
        a.student!.lessons![0].dateString!.compareTo(
            b.student!.lessons![0].dateString!));
    return gradebook;
  }

  List<String>? returnList() {
    _sortGradeBookByDate(widget.gradebook);
    List<String>? subjAbbrev = [];
    for (int i = 0; i < widget.gradebook[0].student!.lessons!.length; i++) {
      bool isHere = false;
      for (int j = 0; j < subjAbbrev.length; j++) {
        if (widget.gradebook[0].student!.lessons![i].lessonNameAbbrev ==
            subjAbbrev[j]) {
          isHere = true;
          break;
        }
      }
      if (isHere == false) {
        subjAbbrev.add(
            widget.gradebook[0].student!.lessons![i].lessonNameAbbrev!);
      }
    }
    return subjAbbrev;
  }

  List<LessonDto>? fillList(List<String>? abbrev) {
    List<LessonDto>? result = [];

    for (int j = 0; j < abbrev!.length; j++) {
      List<SubjectType>? controlPointPz = [];
      List<SubjectType>? controlPointLc = [];
      List<SubjectType>? controlPointLw = [];
      for (int i = 0; i < widget.gradebook[0].student!.lessons!.length; i++) {
        if (widget.gradebook[0].student!.lessons![i].lessonNameAbbrev ==
            abbrev[j]) {
          if (widget.gradebook[0].student!.lessons![i].lessonTypeAbbrev ==
              "ПЗ") {
            int mark = 0;
            if (widget.gradebook[0].student!.lessons![i].marks!.isNotEmpty) {
              mark = widget.gradebook[0].student!.lessons![i].marks![0];
            }
            controlPointPz.add(SubjectType(
                widget.gradebook[0].student!.lessons![i].dateString != null
                    ? widget.gradebook[0].student!.lessons![i].dateString!
                    : "",
                widget.gradebook[0].student!.lessons![i].gradeBookOmissions !=
                    null
                    ? widget.gradebook[0].student!.lessons![i]
                    .gradeBookOmissions!
                    : 0,
                widget.gradebook[0].student!.lessons![i].marks != null
                    ? mark
                    : 0,
                widget.gradebook[0].student!.lessons![i].controlPoint != null
                    ? widget.gradebook[0].student!.lessons![i].controlPoint!
                    : ""
            ));
          }
          else if (widget.gradebook[0].student!.lessons![i].lessonTypeAbbrev ==
              "ЛК") {
            int mark = 0;
            if (widget.gradebook[0].student!.lessons![i].marks!.isNotEmpty) {
              mark = widget.gradebook[0].student!.lessons![i].marks![0];
            }
            controlPointLc.add(SubjectType(
                widget.gradebook[0].student!.lessons![i].dateString != null
                    ? widget.gradebook[0].student!.lessons![i].dateString!
                    : "",
                widget.gradebook[0].student!.lessons![i].gradeBookOmissions !=
                    null
                    ? widget.gradebook[0].student!.lessons![i]
                    .gradeBookOmissions!
                    : 0,
                widget.gradebook[0].student!.lessons![i].marks != null
                    ? mark
                    : 0,
                widget.gradebook[0].student!.lessons![i].controlPoint != null
                    ? widget.gradebook[0].student!.lessons![i].controlPoint!
                    : ""
            ));
          }
          else if (widget.gradebook[0].student!.lessons![i].lessonTypeAbbrev ==
              "ЛР") {
            int mark = 0;
            if (widget.gradebook[0].student!.lessons![i].marks!.isNotEmpty) {
              mark = widget.gradebook[0].student!.lessons![i].marks![0];
            }
            controlPointLw.add(SubjectType(
                widget.gradebook[0].student!.lessons![i].dateString != null
                    ? widget.gradebook[0].student!.lessons![i].dateString!
                    : "",
                widget.gradebook[0].student!.lessons![i].gradeBookOmissions !=
                    null
                    ? widget.gradebook[0].student!.lessons![i]
                    .gradeBookOmissions!
                    : 0,
                widget.gradebook[0].student!.lessons![i].marks != null
                    ? mark
                    : 0,
                widget.gradebook[0].student!.lessons![i].controlPoint != null
                    ? widget.gradebook[0].student!.lessons![i].controlPoint!
                    : ""
            ));
          }
        }
      }
      result.add(LessonDto(abbrev[j],
          ControlPoint(controlPointPz, controlPointLc, controlPointLw)));
    }
    return result;
  }

  List<int>? marksByLesson(int n, List<LessonDto> lesson, int typeOfSubject,
      String controlPoint) {
    List<int> markForSubjects = [];
    switch (typeOfSubject) {
      case 1:
        if (lesson[n].controlpoint!.pz!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.pz!.length; i++) {
            if (lesson[n].controlpoint!.pz![i].point == controlPoint) {
              if (lesson[n].controlpoint!.pz![i].mark != 0) {
                markForSubjects.add(lesson[n].controlpoint!.pz![i].mark!);
              }
            }
          }
          return markForSubjects;
        }
        else {
          return null;
        }
      case 2:
        if (lesson[n].controlpoint!.lc!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.lc!.length; i++) {
            if (lesson[n].controlpoint!.lc![i].point == controlPoint) {
              if (lesson[n].controlpoint!.lc![i].mark != 0) {
                markForSubjects.add(lesson[n].controlpoint!.lc![i].mark!);
              }
            }
          }
          return markForSubjects;
        }
        else {
          return null;
        }
      case 3:
        if (lesson[n].controlpoint!.lw!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.lw!.length; i++) {
            if (lesson[n].controlpoint!.lw![i].point == controlPoint) {
              if (lesson[n].controlpoint!.lw![i].mark != 0) {
                markForSubjects.add(lesson[n].controlpoint!.lw![i].mark!);
              }
            }
          }
          return markForSubjects;
        }
        else {
          return null;
        }
    }
    return null;
  }

  int? omissionsByLesson(int n, List<LessonDto> lesson, int typeOfSubject,
      String controlPoint) {
    int result = 0;
    switch (typeOfSubject) {
      case 1:
        if (lesson[n].controlpoint!.pz!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.pz!.length; i++) {
            if (lesson[n].controlpoint!.pz![i].point == controlPoint) {
              result += lesson[n].controlpoint!.pz![i].omissions!;
            }
          }
          return result;
        }
        else {
          return 0;
        }
      case 2:
        if (lesson[n].controlpoint!.lc!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.lc!.length; i++) {
            if (lesson[n].controlpoint!.lc![i].point == controlPoint) {
              result += lesson[n].controlpoint!.lc![i].omissions!;
            }
          }
          return result;
        }
        else {
          return 0;
        }
      case 3:
        if (lesson[n].controlpoint!.lw!.isNotEmpty) {
          for (int i = 0; i < lesson[n].controlpoint!.lw!.length; i++) {
            if (lesson[n].controlpoint!.lw![i].point == controlPoint) {
              result += lesson[n].controlpoint!.lw![i].omissions!;
            }
          }
          return result;
        }
        else {
          return 0;
        }
    }
    return 0;
  }

  List<String>? itemsForDropdownButton(List<LessonDto> lesson) {
    List<String> items = [];
    if (lesson.isNotEmpty) {
      for (int i = 0; i < lesson.length; i++) {
        if (lesson[i].controlpoint!.pz!.isNotEmpty) {
          for (int j = 0; j < lesson[i].controlpoint!.pz!.length; j++) {
            if (items.isEmpty) {
              items.add(lesson[i].controlpoint!.pz![j].point!);
              continue;
            }
            bool isHere = false;
            for (int k = 0; k < items.length; k++) {
              if (lesson[i].controlpoint!.pz![j].point == items[k]) {
                isHere = true;
              }
              if (items.length == 4) {
                return items;
              }
            }
            if (isHere == false) {
              items.add(lesson[i].controlpoint!.pz![j].point!);
            }
          }
        }
        else if (lesson[i].controlpoint!.lc!.isNotEmpty) {
          for (int j = 0; j < lesson[i].controlpoint!.lc!.length; j++) {
            if (items.isEmpty) {
              items.add(lesson[i].controlpoint!.lc![j].point!);
              continue;
            }
            bool isHere = false;
            for (int k = 0; k < items.length; k++) {
              if (lesson[i].controlpoint!.lc![j].point == items[k]) {
                isHere = true;
              }
              if (items.length == 4) {
                return items;
              }
            }
            if (isHere == false) {
              items.add(lesson[i].controlpoint!.lc![j].point!);
            }
          }
        }
        else if (lesson[i].controlpoint!.lw!.isNotEmpty) {
          for (int j = 0; j < lesson[i].controlpoint!.lw!.length; j++) {
            if (items.isEmpty) {
              items.add(lesson[i].controlpoint!.lw![j].point!);
              continue;
            }
            bool isHere = false;
            for (int k = 0; k < items.length; k++) {
              if (lesson[i].controlpoint!.lw![j].point == items[k]) {
                isHere = true;
              }
              if (items.length == 4) {
                return items;
              }
            }
            if (isHere == false) {
              items.add(lesson[i].controlpoint!.lw![j].point!);
            }
          }
        }
      }
      return items;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<LessonDto>? lesson = fillList(returnList());
    List<String>? item = itemsForDropdownButton(lesson!)!;
    String? selected = item[0].toString();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(22, 49, 99, 0.9),
          centerTitle: true,
          title: const Text('Р Е Й Т И Н Г'),
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelStyle: const TextStyle(fontSize: 24),
              unselectedLabelStyle: const TextStyle(fontSize: 20),
              tabs: [
                Text(
                  item[0],
                  style: const TextStyle(
                    color: Color.fromRGBO(22, 49, 99, 0.9),
                  ),
                ),
                Text(
                  item[1],
                  style: const TextStyle(
                    color: Color.fromRGBO(22, 49, 99, 0.9),
                  ),
                ),
                Text(
                  item[2],
                  style: const TextStyle(
                    color: Color.fromRGBO(22, 49, 99, 0.9),
                  ),
                ),
                Text(
                  item[3],
                  style: const TextStyle(
                    color: Color.fromRGBO(22, 49, 99, 0.9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: buildSafeArea(lesson, item[0]),
                  ),
                  Container(child: buildSafeArea(lesson, item[1])),
                  Container(child: buildSafeArea(lesson, item[2])),
                  Container(child: buildSafeArea(lesson, item[3])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildSafeArea(List<LessonDto> lesson, String selected) {
    return ListView.builder(
        itemCount: lesson.isNotEmpty
            ? lesson.length
            : 0,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: MediaQuery
                .of(context)
                .size
                .width - 20,
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        lesson[index].lessonNameAbbrev!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(22, 49, 99, 0.9),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'ПЗ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  marksByLesson(index, lesson, 1, selected!) !=
                                      null
                                      ? marksByLesson(
                                      index, lesson, 1, selected)!.length
                                      .toString()
                                      : '0',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' шт.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  omissionsByLesson(
                                      index, lesson, 1, selected!) != null
                                      ? omissionsByLesson(
                                      index, lesson, 1, selected!)!.toString()
                                      : '0',
                                ),
                                const Text(
                                  ' ч.',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 3),
                        Column(
                          children: [
                            const Text(
                              'ЛК',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  marksByLesson(index, lesson, 2, selected!) !=
                                      null
                                      ? marksByLesson(
                                      index, lesson, 2, selected!)!.length
                                      .toString()
                                      : '0',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' шт.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  omissionsByLesson(
                                      index, lesson, 2, selected!) != null
                                      ? omissionsByLesson(
                                      index, lesson, 2, selected!)!.toString()
                                      : '0',
                                ),
                                const Text(
                                  ' ч.',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 3 - 20),
                        Column(
                          children: [
                            const Text(
                              'ЛР',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  marksByLesson(index, lesson, 3, selected!) !=
                                      null
                                      ? marksByLesson(
                                      index, lesson, 3, selected!)!.length
                                      .toString()
                                      : '0',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' шт.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  omissionsByLesson(
                                      index, lesson, 3, selected!) != null
                                      ? omissionsByLesson(
                                      index, lesson, 3, selected!)!.toString()
                                      : '0',
                                ),
                                const Text(
                                  ' ч.',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
