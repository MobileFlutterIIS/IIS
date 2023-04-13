// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GradeBook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradeBook _$GradeBookFromJson(Map<String, dynamic> json) => GradeBook(
      json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GradeBookToJson(GradeBook instance) => <String, dynamic>{
      'student': instance.student,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      json['fio'] as String?,
      json['id'] as int?,
      json['subGroup'] as int?,
      json['subGroupStudent'] as int?,
      (json['lessons'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'fio': instance.fio,
      'id': instance.id,
      'subGroup': instance.subGroup,
      'subGroupStudent': instance.subGroupStudent,
      'lessons': instance.lessons,
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      json['id'] as int?,
      json['dateString'] as String?,
      json['gradeBookOmissions'] as int?,
      json['lessonTypeId'] as int?,
      json['lessonTypeAbbrev'] as String?,
      json['lessonNameAbbrev'] as String?,
      json['subGroup'] as int?,
      (json['marks'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['controlPoint'] as String?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'dateString': instance.dateString,
      'gradeBookOmissions': instance.gradeBookOmissions,
      'lessonTypeId': instance.lessonTypeId,
      'lessonTypeAbbrev': instance.lessonTypeAbbrev,
      'lessonNameAbbrev': instance.lessonNameAbbrev,
      'subGroup': instance.subGroup,
      'marks': instance.marks,
      'controlPoint': instance.controlPoint,
    };
