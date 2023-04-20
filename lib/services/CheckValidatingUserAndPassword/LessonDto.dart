import 'package:json_annotation/json_annotation.dart';
part 'LessonDto.g.dart';

@JsonSerializable()
class LessonDto{

  String? lessonNameAbbrev;
  ControlPoint? controlpoint;

  LessonDto(
      this.lessonNameAbbrev,
      this.controlpoint
      );

  factory LessonDto.fromJson(Map<String, dynamic> json) => _$LessonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);
}

@JsonSerializable()
class ControlPoint{
  List<SubjectType>? pz;
  List<SubjectType>? lc;
  List<SubjectType>? lw;


  ControlPoint(
      this.pz,
      this.lc,
      this.lw
      );


  factory ControlPoint.fromJson(Map<String, dynamic> json) => _$ControlPointFromJson(json);
  Map<String, dynamic> toJson() => _$ControlPointToJson(this);
}

@JsonSerializable()
class SubjectType{
  String? date;
  int? omissions;
  int? mark;
  String? point;

  SubjectType(
      this.date,
      this.omissions,
      this.mark,
      this.point
      );

  factory SubjectType.fromJson(Map<String, dynamic> json) => _$SubjectTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectTypeToJson(this);
}