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
