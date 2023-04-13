import 'package:json_annotation/json_annotation.dart';
part 'GradeBook.g.dart';

@JsonSerializable()
class GradeBook{
  Student? student;
  // List<Student>? students;

  GradeBook(
      this.student,
      //this.students
      );

  factory GradeBook.fromJson(Map<String, dynamic> json) => _$GradeBookFromJson(json);
  Map<String, dynamic> toJson() => _$GradeBookToJson(this);
}

@JsonSerializable()
class Student{
  String? fio;
  int? id;
  int? subGroup;
  int? subGroupStudent;
  List<Lesson>? lessons;

  Student(
      this.fio,
      this.id,
      this.subGroup,
      this.subGroupStudent,
      this.lessons
      );

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class Lesson{
  int? id;
  String? dateString;
  int? gradeBookOmissions;
  int? lessonTypeId;
  String? lessonTypeAbbrev;
  String? lessonNameAbbrev;
  int? subGroup;
  List<int>? marks;
  String? controlPoint;

  Lesson(
    this.id,
    this.dateString,
    this.gradeBookOmissions,
    this.lessonTypeId,
    this.lessonTypeAbbrev,
    this.lessonNameAbbrev,
    this.subGroup,
    this.marks,
    this.controlPoint
    );

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}










