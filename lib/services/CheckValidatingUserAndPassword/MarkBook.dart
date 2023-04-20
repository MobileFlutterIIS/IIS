import "package:json_annotation/json_annotation.dart";

part 'MarkBook.g.dart';

@JsonSerializable()
class Markbook {
  String? number;
  double? averageMark;
  Map<int,Simestre>? markPages;


  Markbook(this.number, this.averageMark, this.markPages);

  factory Markbook.fromJson(Map<String, dynamic> json) =>
      _$MarkbookFromJson(json);

  Map<String, dynamic> toJson() => _$MarkbookToJson(this);
}

@JsonSerializable()
class Simestre {

  double? averageMark;
  List<Marks>? marks;


  Simestre(this.averageMark, this.marks);

  factory Simestre.fromJson(Map<String, dynamic> json) =>
      _$SimestreFromJson(json);

  Map<String, dynamic> toJson() => _$SimestreToJson(this);
}

@JsonSerializable()
class Marks {

  String? subject;
  String? formOfControl;
  String? fullSubject;
  String? hours;
  String? mark;
  String? date;
  String? teacher;
  double? commonMark;
  double? commonRetakes;
  int? retakesCount;
  int? idSubject;
  int? idFormOfControl;
  bool? canStudyInParallel;
  bool? applicationHasAlreadyBeenSentForParallel;
  bool? canLiquidationAcademicDifferences;
  bool? applicationHasAlreadyBeenSentForAcademicDifferences;
  List<LmsEducationTerms>? lmsEducationTerms;


  Marks(
      this.subject,
      this.formOfControl,
      this.fullSubject,
      this.hours,
      this.mark,
      this.date,
      this.teacher,
      this.commonMark,
      this.commonRetakes,
      this.retakesCount,
      this.idSubject,
      this.idFormOfControl,
      this.canStudyInParallel,
      this.applicationHasAlreadyBeenSentForParallel,
      this.canLiquidationAcademicDifferences,
      this.applicationHasAlreadyBeenSentForAcademicDifferences,
      this.lmsEducationTerms);

  factory Marks.fromJson(Map<String, dynamic> json) =>
      _$MarksFromJson(json);

  Map<String, dynamic> toJson() => _$MarksToJson(this);
}

@JsonSerializable()
class LmsEducationTerms {
  int? idLmsEducationTerm;
  String? subjectNameByApi;
  bool? coincidedForeignLanguage;


  LmsEducationTerms(this.idLmsEducationTerm, this.subjectNameByApi,
      this.coincidedForeignLanguage);

  factory LmsEducationTerms.fromJson(Map<String, dynamic> json) =>
      _$LmsEducationTermsFromJson(json);

  Map<String, dynamic> toJson() => _$LmsEducationTermsToJson(this);

}
