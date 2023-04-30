import 'package:json_annotation/json_annotation.dart';
part 'ContactsToReset.g.dart';

@JsonSerializable()
class ContactsToReset{
  List<Contact>? contacts;
  int? remainingAttempts;
  bool? employee;

  ContactsToReset(
      this.contacts,
      this.remainingAttempts,
      this.employee,
      );

  factory ContactsToReset.fromJson(Map<String, dynamic> json) => _$ContactsToResetFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsToResetToJson(this);
}

@JsonSerializable()
class Contact{
  String? contactValue;
  int? contactTypeId;
  String? codeExpirationTime;

  Contact(
      this.contactValue,
      this.contactTypeId,
      this.codeExpirationTime,
      );

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}