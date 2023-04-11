import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';

part 'CertificateGroupNotifications.g.dart';

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


@JsonSerializable()
class Notification{

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


  Notification(
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

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
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