import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';

part 'CertificateGroupAnouncements.g.dart';



///STUDY

@JsonSerializable()
class Certificate{

  String? certificateType;
  String? dateOrder;
  int? id;
  String? provisionPlace;
  String? rejectionReason;
  int? status;


  Certificate(this.certificateType, this.dateOrder, this.id,
      this.provisionPlace, this.rejectionReason, this.status);

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}
@JsonSerializable()
class PlaceType{

  List<Place>? places;
  String? type;

  PlaceType(this.places, this.type);

  factory PlaceType.fromJson(Map<String, dynamic> json) => _$PlaceTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceTypeToJson(this);
}
@JsonSerializable()
class Place{

   int? id;
   String? name;
   int? type;


   Place(this.id, this.name, this.type);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

@JsonSerializable()
class CertificateBody{

  int? certificateCount;
  CertificateDTO? certificateRequestDto;


  CertificateBody(this.certificateCount, this.certificateRequestDto);

  factory CertificateBody.fromJson(Map<String, dynamic> json) => _$CertificateBodyFromJson(json);
  Map<String, dynamic> toJson() => _$CertificateBodyToJson(this);
}

@JsonSerializable()
class CertificateDTO{

  String? certificateType;
  String? provisionPlace;


  CertificateDTO(this.certificateType, this.provisionPlace);

  factory CertificateDTO.fromJson(Map<String, dynamic> json) => _$CertificateDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CertificateDTOToJson(this);
}

/// GROUP

@JsonSerializable()
class Groupinfo{

  String? numberOfGroup;
  List<GroupStudentInfo>? groupInfoStudentDto;


  Groupinfo(this.numberOfGroup, this.groupInfoStudentDto);

  factory Groupinfo.fromJson(Map<String, dynamic> json) => _$GroupinfoFromJson(json);
  Map<String, dynamic> toJson() => _$GroupinfoToJson(this);
}


@JsonSerializable()
class GroupStudentInfo{

  String? position;
  String? fio;
  String? phone;
  String? email;
  String? urlId;


  GroupStudentInfo(this.position, this.fio, this.phone, this.email, this.urlId);

  factory GroupStudentInfo.fromJson(Map<String, dynamic> json) => _$GroupStudentInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GroupStudentInfoToJson(this);
}

/// ANOUNCEMENTS

@JsonSerializable()
class Anouncement{

  String? auditory;
  String? content;
  String? date;
  String? employee;
  List<String?>? employeeDepartments;
  String? endTime;
  int? id;
  String? startTime;
  List<StudentGroup>? studentGroups;
  String? urlId;


  Anouncement(
      this.auditory,
      this.content,
      this.date,
      this.employee,
      this.employeeDepartments,
      this.endTime,
      this.id,
      this.startTime,
      this.studentGroups,
      this.urlId);

  factory Anouncement.fromJson(Map<String, dynamic> json) => _$AnouncementFromJson(json);
  Map<String, dynamic> toJson() => _$AnouncementToJson(this);
}


@JsonSerializable()
class StudentGroup{

int? id;
String? name;
String? specialityAbbrev;


StudentGroup(this.id, this.name, this.specialityAbbrev);

  factory StudentGroup.fromJson(Map<String, dynamic> json) => _$StudentGroupFromJson(json);
  Map<String, dynamic> toJson() => _$StudentGroupToJson(this);
}

//////////////////

@JsonSerializable()
class MarkSheet{

  String? absentDate;
  bool? certificate;
  String? createDate;
  Employee? employee;
  String? expireDate;
  double? hours;
  int? id;
  MarkSheetType? markSheetType;
  String? number;
  PaymentFormMap? paymentFormMap;
  double? price;
  int? reason;
  String? rejectionReason;
  String? requestValidationDoc;
  int? retakeCount;
  String? status;
  Subject? subject;
  int? term;


  MarkSheet(
      this.absentDate,
      this.certificate,
      this.createDate,
      this.employee,
      this.expireDate,
      this.hours,
      this.id,
      this.markSheetType,
      this.number,
      this.paymentFormMap,
      this.price,
      this.reason,
      this.rejectionReason,
      this.requestValidationDoc,
      this.retakeCount,
      this.status,
      this.subject,
      this.term);

  factory MarkSheet.fromJson(Map<String, dynamic> json) => _$MarkSheetFromJson(json);
  Map<String, dynamic> toJson() => _$MarkSheetToJson(this);
}

@JsonSerializable()
class Employee{

  String? academicDepartment;
  String? fio;
  String? firstName;
  int? id;
  String? lastName;
  String? middleName;
  double? price;


  Employee(this.academicDepartment, this.fio, this.firstName, this.id,
      this.lastName, this.middleName, this.price);

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

@JsonSerializable()
class MarkSheetType{

  double? coefficient;
  String? fullName;
  int? id;
  bool? isCourseWork;
  bool? isExam;
  bool? isLab;
  bool? isOffset;
  bool? isRemote;
  double? price;
  String? shortName;


  MarkSheetType(
      this.coefficient,
      this.fullName,
      this.id,
      this.isCourseWork,
      this.isExam,
      this.isLab,
      this.isOffset,
      this.isRemote,
      this.price,
      this.shortName);

  factory MarkSheetType.fromJson(Map<String, dynamic> json) => _$MarkSheetTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MarkSheetTypeToJson(this);
}

@JsonSerializable()
class PaymentFormMap{

  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  PaymentFormMap(
      this.additionalProp1, this.additionalProp2, this.additionalProp3);

  factory PaymentFormMap.fromJson(Map<String, dynamic> json) => _$PaymentFormMapFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentFormMapToJson(this);
}

@JsonSerializable()
class Subject{

  String? abbrev;
  int? focsId;
  int? id;
  String? lessonTypeAbbrev;
  String? name;
  int? term;
  int? thId;


  Subject(this.abbrev, this.focsId, this.id, this.lessonTypeAbbrev, this.name,
      this.term, this.thId);

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

