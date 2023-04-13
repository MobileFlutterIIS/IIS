import 'package:json_annotation/json_annotation.dart';
part 'Omissions.g.dart';

@JsonSerializable()
class Omission{
  int? dateFrom;
  int? dateTo;
  int? id;
  String? name;
  String? note;
  String? term;

  Omission(
      this.dateFrom,
      this.dateTo,
      this.id,
      this.name,
      this.note,
      this.term
      );

  factory Omission.fromJson(Map<String, dynamic> json) => _$OmissionFromJson(json);
  Map<String, dynamic> toJson() => _$OmissionToJson(this);
}