// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LessonDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
      json['lessonNameAbbrev'] as String?,
      json['controlpoint'] == null
          ? null
          : ControlPoint.fromJson(json['controlpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      'lessonNameAbbrev': instance.lessonNameAbbrev,
      'controlpoint': instance.controlpoint,
    };

ControlPoint _$ControlPointFromJson(Map<String, dynamic> json) => ControlPoint(
      (json['pz'] as List<dynamic>?)
          ?.map((e) => SubjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lw'] as List<dynamic>?)
          ?.map((e) => SubjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lc'] as List<dynamic>?)
          ?.map((e) => SubjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ControlPointToJson(ControlPoint instance) =>
    <String, dynamic>{
      'pz': instance.pz,
      'lw': instance.lw,
      'lc': instance.lc,
    };

SubjectType _$SubjectTypeFromJson(Map<String, dynamic> json) => SubjectType(
      json['date'] as String?,
      json['omissions'] as int?,
      json['mark'] as int?,
      json['point'] as String?,
    );

Map<String, dynamic> _$SubjectTypeToJson(SubjectType instance) =>
    <String, dynamic>{
      'date': instance.date,
      'omissions': instance.omissions,
      'mark': instance.mark,
      'point': instance.point,
    };
