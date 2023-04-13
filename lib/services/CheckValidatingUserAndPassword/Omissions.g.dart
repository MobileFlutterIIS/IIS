// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Omissions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Omission _$OmissionFromJson(Map<String, dynamic> json) => Omission(
      json['dateFrom'] as int?,
      json['dateTo'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['note'] as String?,
      json['term'] as String?,
    );

Map<String, dynamic> _$OmissionToJson(Omission instance) => <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'id': instance.id,
      'name': instance.name,
      'note': instance.note,
      'term': instance.term,
    };
