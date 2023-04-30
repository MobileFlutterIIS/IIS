// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactsToReset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsToReset _$ContactsToResetFromJson(Map<String, dynamic> json) =>
    ContactsToReset(
      (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['remainingAttempts'] as int?,
      json['employee'] as bool?,
    );

Map<String, dynamic> _$ContactsToResetToJson(ContactsToReset instance) =>
    <String, dynamic>{
      'contacts': instance.contacts,
      'remainingAttempts': instance.remainingAttempts,
      'employee': instance.employee,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      json['contactValue'] as String?,
      json['contactTypeId'] as int?,
      json['codeExpirationTime'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'contactValue': instance.contactValue,
      'contactTypeId': instance.contactTypeId,
      'codeExpirationTime': instance.codeExpirationTime,
    };
