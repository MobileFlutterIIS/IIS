// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CertificateGroupNotifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
      json['certificateType'] as String?,
      json['dateOrder'] as String?,
      json['id'] as int?,
      json['provisionPlace'] as String?,
      json['rejectionReason'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'certificateType': instance.certificateType,
      'dateOrder': instance.dateOrder,
      'id': instance.id,
      'provisionPlace': instance.provisionPlace,
      'rejectionReason': instance.rejectionReason,
      'status': instance.status,
    };

Groupinfo _$GroupinfoFromJson(Map<String, dynamic> json) => Groupinfo(
      json['numberOfGroup'] as String?,
      (json['groupInfoStudentDto'] as List<dynamic>?)
          ?.map((e) => GroupStudentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupinfoToJson(Groupinfo instance) => <String, dynamic>{
      'numberOfGroup': instance.numberOfGroup,
      'groupInfoStudentDto': instance.groupInfoStudentDto,
    };

GroupStudentInfo _$GroupStudentInfoFromJson(Map<String, dynamic> json) =>
    GroupStudentInfo(
      json['position'] as String?,
      json['fio'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['urlId'] as String?,
    );

Map<String, dynamic> _$GroupStudentInfoToJson(GroupStudentInfo instance) =>
    <String, dynamic>{
      'position': instance.position,
      'fio': instance.fio,
      'phone': instance.phone,
      'email': instance.email,
      'urlId': instance.urlId,
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      json['auditory'] as String?,
      json['content'] as String?,
      json['date'] as String?,
      json['employee'] as String?,
      (json['employeeDepartments'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['endTime'] as String?,
      json['id'] as int?,
      json['startTime'] as String?,
      (json['studentGroups'] as List<dynamic>?)
          ?.map((e) => StudentGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['urlId'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'auditory': instance.auditory,
      'content': instance.content,
      'date': instance.date,
      'employee': instance.employee,
      'employeeDepartments': instance.employeeDepartments,
      'endTime': instance.endTime,
      'id': instance.id,
      'startTime': instance.startTime,
      'studentGroups': instance.studentGroups,
      'urlId': instance.urlId,
    };

StudentGroup _$StudentGroupFromJson(Map<String, dynamic> json) => StudentGroup(
      json['id'] as int?,
      json['name'] as String?,
      json['specialityAbbrev'] as String?,
    );

Map<String, dynamic> _$StudentGroupToJson(StudentGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialityAbbrev': instance.specialityAbbrev,
    };
