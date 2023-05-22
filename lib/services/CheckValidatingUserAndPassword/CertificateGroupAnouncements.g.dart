// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CertificateGroupAnouncements.dart';

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

PlaceType _$PlaceTypeFromJson(Map<String, dynamic> json) => PlaceType(
      (json['places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
    );

Map<String, dynamic> _$PlaceTypeToJson(PlaceType instance) => <String, dynamic>{
      'places': instance.places,
      'type': instance.type,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      json['id'] as int?,
      json['name'] as String?,
      json['type'] as int?,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

CertificateBody _$CertificateBodyFromJson(Map<String, dynamic> json) =>
    CertificateBody(
      json['certificateCount'] as int?,
      json['certificateRequestDto'] == null
          ? null
          : CertificateDTO.fromJson(
              json['certificateRequestDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CertificateBodyToJson(CertificateBody instance) =>
    <String, dynamic>{
      'certificateCount': instance.certificateCount,
      'certificateRequestDto': instance.certificateRequestDto,
    };

CertificateDTO _$CertificateDTOFromJson(Map<String, dynamic> json) =>
    CertificateDTO(
      json['certificateType'] as String?,
      json['provisionPlace'] as String?,
    );

Map<String, dynamic> _$CertificateDTOToJson(CertificateDTO instance) =>
    <String, dynamic>{
      'certificateType': instance.certificateType,
      'provisionPlace': instance.provisionPlace,
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

Anouncement _$AnouncementFromJson(Map<String, dynamic> json) => Anouncement(
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

Map<String, dynamic> _$AnouncementToJson(Anouncement instance) =>
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

MarkSheet _$MarkSheetFromJson(Map<String, dynamic> json) => MarkSheet(
      json['absentDate'] as String?,
      json['certificate'] as bool?,
      json['createDate'] as String?,
      json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      json['expireDate'] as String?,
      (json['hours'] as num?)?.toDouble(),
      json['id'] as int?,
      json['markSheetType'] == null
          ? null
          : MarkSheetType.fromJson(
              json['markSheetType'] as Map<String, dynamic>),
      json['number'] as String?,
      json['paymentFormMap'] == null
          ? null
          : PaymentFormMap.fromJson(
              json['paymentFormMap'] as Map<String, dynamic>),
      (json['price'] as num?)?.toDouble(),
      json['reason'] as int?,
      json['rejectionReason'] as String?,
      json['requestValidationDoc'] as String?,
      json['retakeCount'] as int?,
      json['status'] as String?,
      json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      json['term'] as int?,
    );

Map<String, dynamic> _$MarkSheetToJson(MarkSheet instance) => <String, dynamic>{
      'absentDate': instance.absentDate,
      'certificate': instance.certificate,
      'createDate': instance.createDate,
      'employee': instance.employee,
      'expireDate': instance.expireDate,
      'hours': instance.hours,
      'id': instance.id,
      'markSheetType': instance.markSheetType,
      'number': instance.number,
      'paymentFormMap': instance.paymentFormMap,
      'price': instance.price,
      'reason': instance.reason,
      'rejectionReason': instance.rejectionReason,
      'requestValidationDoc': instance.requestValidationDoc,
      'retakeCount': instance.retakeCount,
      'status': instance.status,
      'subject': instance.subject,
      'term': instance.term,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['academicDepartment'] as String?,
      json['fio'] as String?,
      json['firstName'] as String?,
      json['id'] as int?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'academicDepartment': instance.academicDepartment,
      'fio': instance.fio,
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'price': instance.price,
    };

MarkSheetType _$MarkSheetTypeFromJson(Map<String, dynamic> json) =>
    MarkSheetType(
      (json['coefficient'] as num?)?.toDouble(),
      json['fullName'] as String?,
      json['id'] as int?,
      json['isCourseWork'] as bool?,
      json['isExam'] as bool?,
      json['isLab'] as bool?,
      json['isOffset'] as bool?,
      json['isRemote'] as bool?,
      (json['price'] as num?)?.toDouble(),
      json['shortName'] as String?,
    );

Map<String, dynamic> _$MarkSheetTypeToJson(MarkSheetType instance) =>
    <String, dynamic>{
      'coefficient': instance.coefficient,
      'fullName': instance.fullName,
      'id': instance.id,
      'isCourseWork': instance.isCourseWork,
      'isExam': instance.isExam,
      'isLab': instance.isLab,
      'isOffset': instance.isOffset,
      'isRemote': instance.isRemote,
      'price': instance.price,
      'shortName': instance.shortName,
    };

PaymentFormMap _$PaymentFormMapFromJson(Map<String, dynamic> json) =>
    PaymentFormMap(
      json['additionalProp1'] as String?,
      json['additionalProp2'] as String?,
      json['additionalProp3'] as String?,
    );

Map<String, dynamic> _$PaymentFormMapToJson(PaymentFormMap instance) =>
    <String, dynamic>{
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
      'additionalProp3': instance.additionalProp3,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      json['abbrev'] as String?,
      json['focsId'] as int?,
      json['id'] as int?,
      json['lessonTypeAbbrev'] as String?,
      json['name'] as String?,
      json['term'] as int?,
      json['thId'] as int?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'abbrev': instance.abbrev,
      'focsId': instance.focsId,
      'id': instance.id,
      'lessonTypeAbbrev': instance.lessonTypeAbbrev,
      'name': instance.name,
      'term': instance.term,
      'thId': instance.thId,
    };
