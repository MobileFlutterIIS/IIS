// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MarkBook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Markbook _$MarkbookFromJson(Map<String, dynamic> json) => Markbook(
      json['number'] as String?,
      (json['averageMark'] as num?)?.toDouble(),
      (json['markPages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Simestre.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$MarkbookToJson(Markbook instance) => <String, dynamic>{
      'number': instance.number,
      'averageMark': instance.averageMark,
      'markPages': instance.markPages?.map((k, e) => MapEntry(k.toString(), e)),
    };

Simestre _$SimestreFromJson(Map<String, dynamic> json) => Simestre(
      (json['averageMark'] as num?)?.toDouble(),
      (json['marks'] as List<dynamic>?)
          ?.map((e) => Marks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimestreToJson(Simestre instance) => <String, dynamic>{
      'averageMark': instance.averageMark,
      'marks': instance.marks,
    };

Marks _$MarksFromJson(Map<String, dynamic> json) => Marks(
      json['subject'] as String?,
      json['formOfControl'] as String?,
      json['fullSubject'] as String?,
      json['hours'] as String?,
      json['mark'] as String?,
      json['date'] as String?,
      json['teacher'] as String?,
      (json['commonMark'] as num?)?.toDouble(),
      (json['commonRetakes'] as num?)?.toDouble(),
      json['retakesCount'] as int?,
      json['idSubject'] as int?,
      json['idFormOfControl'] as int?,
      json['canStudyInParallel'] as bool?,
      json['applicationHasAlreadyBeenSentForParallel'] as bool?,
      json['canLiquidationAcademicDifferences'] as bool?,
      json['applicationHasAlreadyBeenSentForAcademicDifferences'] as bool?,
      (json['lmsEducationTerms'] as List<dynamic>?)
          ?.map((e) => LmsEducationTerms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarksToJson(Marks instance) => <String, dynamic>{
      'subject': instance.subject,
      'formOfControl': instance.formOfControl,
      'fullSubject': instance.fullSubject,
      'hours': instance.hours,
      'mark': instance.mark,
      'date': instance.date,
      'teacher': instance.teacher,
      'commonMark': instance.commonMark,
      'commonRetakes': instance.commonRetakes,
      'retakesCount': instance.retakesCount,
      'idSubject': instance.idSubject,
      'idFormOfControl': instance.idFormOfControl,
      'canStudyInParallel': instance.canStudyInParallel,
      'applicationHasAlreadyBeenSentForParallel':
          instance.applicationHasAlreadyBeenSentForParallel,
      'canLiquidationAcademicDifferences':
          instance.canLiquidationAcademicDifferences,
      'applicationHasAlreadyBeenSentForAcademicDifferences':
          instance.applicationHasAlreadyBeenSentForAcademicDifferences,
      'lmsEducationTerms': instance.lmsEducationTerms,
    };

LmsEducationTerms _$LmsEducationTermsFromJson(Map<String, dynamic> json) =>
    LmsEducationTerms(
      json['idLmsEducationTerm'] as int?,
      json['subjectNameByApi'] as String?,
      json['coincidedForeignLanguage'] as bool?,
    );

Map<String, dynamic> _$LmsEducationTermsToJson(LmsEducationTerms instance) =>
    <String, dynamic>{
      'idLmsEducationTerm': instance.idLmsEducationTerm,
      'subjectNameByApi': instance.subjectNameByApi,
      'coincidedForeignLanguage': instance.coincidedForeignLanguage,
    };
