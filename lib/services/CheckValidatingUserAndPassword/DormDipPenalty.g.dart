// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DormDipPenalty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DormReq _$DormReqFromJson(Map<String, dynamic> json) => DormReq(
      json['acceptedDate'] as int?,
      json['applicationDate'] as int?,
      json['docContent'] as String?,
      json['docReference'] as String?,
      json['id'] as int?,
      json['number'] as int?,
      json['numberInQueue'] as int?,
      json['rejectionReason'] as String?,
      json['roomInfo'] as String?,
      json['settledDate'] as int?,
      json['status'] as String?,
    );

Map<String, dynamic> _$DormReqToJson(DormReq instance) => <String, dynamic>{
      'acceptedDate': instance.acceptedDate,
      'applicationDate': instance.applicationDate,
      'docContent': instance.docContent,
      'docReference': instance.docReference,
      'id': instance.id,
      'number': instance.number,
      'numberInQueue': instance.numberInQueue,
      'rejectionReason': instance.rejectionReason,
      'roomInfo': instance.roomInfo,
      'settledDate': instance.settledDate,
      'status': instance.status,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      json['academicDepartment'] as String?,
      json['fio'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'academicDepartment': instance.academicDepartment,
      'fio': instance.fio,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'id': instance.id,
      'price': instance.price,
    };

Subj _$SubjFromJson(Map<String, dynamic> json) => Subj(
      json['abbrev'] as String?,
      json['etId'] as int?,
      json['term'] as int?,
      (json['lessonTypes'] as List<dynamic>)
          .map((e) => LessonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjToJson(Subj instance) => <String, dynamic>{
      'abbrev': instance.abbrev,
      'etId': instance.etId,
      'term': instance.term,
      'lessonTypes': instance.lessonTypes,
    };

LessonType _$LessonTypeFromJson(Map<String, dynamic> json) => LessonType(
      json['abbrev'] as String?,
      json['focsId'] as int?,
      json['thId'] as int?,
      json['isCourseWork'] as bool?,
      json['isExam'] as bool?,
      json['isLab'] as bool?,
      json['isOffset'] as bool?,
      json['isRemote'] as bool?,
      json['fullName'] as String?,
      (json['coefficient'] as num?)?.toDouble(),
      json['id'] as int?,
      (json['price'] as num?)?.toDouble(),
      json['shortName'] as String?,
    );

Map<String, dynamic> _$LessonTypeToJson(LessonType instance) =>
    <String, dynamic>{
      'abbrev': instance.abbrev,
      'focsId': instance.focsId,
      'thId': instance.thId,
      'isCourseWork': instance.isCourseWork,
      'isExam': instance.isExam,
      'isLab': instance.isLab,
      'isOffset': instance.isOffset,
      'isRemote': instance.isRemote,
      'fullName': instance.fullName,
      'coefficient': instance.coefficient,
      'id': instance.id,
      'price': instance.price,
      'shortName': instance.shortName,
    };
