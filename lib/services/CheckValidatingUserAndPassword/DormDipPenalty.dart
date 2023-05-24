import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';

part 'DormDipPenalty.g.dart';

@JsonSerializable()
class DormReq{

 int? acceptedDate;
 int? applicationDate;
 String? docContent;
 String? docReference;
 int? id;
 int? number;
 int? numberInQueue;
 String? rejectionReason;
 String? roomInfo;
 int? settledDate;
 String? status;


 DormReq(
      this.acceptedDate,
      this.applicationDate,
      this.docContent,
      this.docReference,
      this.id,
      this.number,
      this.numberInQueue,
      this.rejectionReason,
      this.roomInfo,
      this.settledDate,
      this.status);

  factory DormReq.fromJson(Map<String, dynamic> json) => _$DormReqFromJson(json);
  Map<String, dynamic> toJson() => _$DormReqToJson(this);
}


@JsonSerializable()
class Mentor{

 String? academicDepartment;
 String? fio;
 String? firstName;
 String? lastName;
 String? middleName;
 int? id;
 double? price;


 Mentor(this.academicDepartment, this.fio, this.firstName, this.lastName,
      this.middleName, this.id, this.price);

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);
 Map<String, dynamic> toJson() => _$MentorToJson(this);
}

@JsonSerializable()
class Subj{

 String? abbrev;
 int? etId;
 int? term;
 List<LessonType> lessonTypes;


 Subj(this.abbrev, this.etId, this.term, this.lessonTypes);

  factory Subj.fromJson(Map<String, dynamic> json) => _$SubjFromJson(json);
 Map<String, dynamic> toJson() => _$SubjToJson(this);
}

@JsonSerializable()
class LessonType{

 String? abbrev;
 int? focsId;
 int? thId;

 bool? isCourseWork;
 bool? isExam;
 bool? isLab;
 bool? isOffset;
 bool? isRemote;


 String? fullName;
 double? coefficient;
 int? id;
double? price;
String? shortName;


 LessonType(
      this.abbrev,
      this.focsId,
      this.thId,
      this.isCourseWork,
      this.isExam,
      this.isLab,
      this.isOffset,
      this.isRemote,
      this.fullName,
      this.coefficient,
      this.id,
      this.price,
      this.shortName);

  factory LessonType.fromJson(Map<String, dynamic> json) => _$LessonTypeFromJson(json);
 Map<String, dynamic> toJson() => _$LessonTypeToJson(this);
}
