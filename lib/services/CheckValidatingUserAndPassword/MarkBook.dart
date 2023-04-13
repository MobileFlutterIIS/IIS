import "package:json_annotation/json_annotation.dart";
part 'MarkBook.g.dart';

@JsonSerializable()
class MarkBook{
  double? averageMark;
  MarkPages? additionalProp1;
  MarkPages? additionalProp2;

  MarkBook(
      this.averageMark,
      this.additionalProp1,
      this.additionalProp2
      );

  factory MarkBook.fromJson(Map<String, dynamic> json) => _$MarkBookFromJson(json);
  Map<String, dynamic> toJson() => _$MarkBookToJson(this);
}

@JsonSerializable()
class MarkPages{
  double? averageMark;
  List<Marks>? marks;

  MarkPages(
      this.averageMark,
      this.marks
      );

  factory MarkPages.fromJson(Map<String, dynamic> json) => _$MarkPagesFromJson(json);
  Map<String, dynamic> toJson() => _$MarkPagesToJson(this);
}

@JsonSerializable()
class Marks{
  bool? applicationHasAlreadyBeenSentForAcademicDifferences;
  bool? applicationHasAlreadyBeenSentForParallel;
  bool? canLiquidationAcademicDifferences;
  bool? canStudyInParallel;
  double? commonMark;
  double? commonRetakes;
  String? date;
  String? formOfControl;
  String? fullSubject;
  String? hours;
  int? idFormOfControl;
  int? idSubject;
  String? mark;
  int? retakesCount;
  LmsEducationTerms? lmsEducationTerms;

  Marks(
    this.applicationHasAlreadyBeenSentForAcademicDifferences,
    this.applicationHasAlreadyBeenSentForParallel,
    this.canLiquidationAcademicDifferences,
    this.canStudyInParallel,
    this.commonMark,
    this.commonRetakes,
    this.date,
    this.formOfControl,
    this.fullSubject,
    this.hours,
    this.idFormOfControl,
    this.idSubject,
    this.mark,
    this.retakesCount,
    this.lmsEducationTerms
    );

  factory Marks.fromJson(Map<String, dynamic> json) => _$MarksFromJson(json);
  Map<String, dynamic> toJson() => _$MarksToJson(this);
}

@JsonSerializable()
class LmsEducationTerms{
  bool? coincidedForeignLanguage;
  int? idLmsEducationTerm;
  String? subjectNameByApi;

  LmsEducationTerms(
      this.coincidedForeignLanguage,
      this.idLmsEducationTerm,
      this.subjectNameByApi
      );

  factory LmsEducationTerms.fromJson(Map<String, dynamic> json) => _$LmsEducationTermsFromJson(json);
  Map<String, dynamic> toJson() => _$LmsEducationTermsToJson(this);
}











