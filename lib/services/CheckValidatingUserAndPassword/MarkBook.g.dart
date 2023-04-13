// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MarkBook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkBook _$MarkBookFromJson(Map<String, dynamic> json) => MarkBook(
      (json['averageMark'] as num?)?.toDouble(),
      json['additionalProp1'] == null
          ? null
          : MarkPages.fromJson(json['additionalProp1'] as Map<String, dynamic>),
      json['additionalProp2'] == null
          ? null
          : MarkPages.fromJson(json['additionalProp2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarkBookToJson(MarkBook instance) => <String, dynamic>{
      'averageMark': instance.averageMark,
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
    };

MarkPages _$MarkPagesFromJson(Map<String, dynamic> json) => MarkPages(
      (json['averageMark'] as num?)?.toDouble(),
      (json['marks'] as List<dynamic>?)
          ?.map((e) => Marks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarkPagesToJson(MarkPages instance) => <String, dynamic>{
      'averageMark': instance.averageMark,
      'marks': instance.marks,
    };

Marks _$MarksFromJson(Map<String, dynamic> json) => Marks(
      json['applicationHasAlreadyBeenSentForAcademicDifferences'] as bool?,
      json['applicationHasAlreadyBeenSentForParallel'] as bool?,
      json['canLiquidationAcademicDifferences'] as bool?,
      json['canStudyInParallel'] as bool?,
      (json['commonMark'] as num?)?.toDouble(),
      (json['commonRetakes'] as num?)?.toDouble(),
      json['date'] as String?,
      json['formOfControl'] as String?,
      json['fullSubject'] as String?,
      json['hours'] as String?,
      json['idFormOfControl'] as int?,
      json['idSubject'] as int?,
      json['mark'] as String?,
      json['retakesCount'] as int?,
      json['lmsEducationTerms'] == null
          ? null
          : LmsEducationTerms.fromJson(
              json['lmsEducationTerms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarksToJson(Marks instance) => <String, dynamic>{
      'applicationHasAlreadyBeenSentForAcademicDifferences':
          instance.applicationHasAlreadyBeenSentForAcademicDifferences,
      'applicationHasAlreadyBeenSentForParallel':
          instance.applicationHasAlreadyBeenSentForParallel,
      'canLiquidationAcademicDifferences':
          instance.canLiquidationAcademicDifferences,
      'canStudyInParallel': instance.canStudyInParallel,
      'commonMark': instance.commonMark,
      'commonRetakes': instance.commonRetakes,
      'date': instance.date,
      'formOfControl': instance.formOfControl,
      'fullSubject': instance.fullSubject,
      'hours': instance.hours,
      'idFormOfControl': instance.idFormOfControl,
      'idSubject': instance.idSubject,
      'mark': instance.mark,
      'retakesCount': instance.retakesCount,
      'lmsEducationTerms': instance.lmsEducationTerms,
    };

LmsEducationTerms _$LmsEducationTermsFromJson(Map<String, dynamic> json) =>
    LmsEducationTerms(
      json['coincidedForeignLanguage'] as bool?,
      json['idLmsEducationTerm'] as int?,
      json['subjectNameByApi'] as String?,
    );

Map<String, dynamic> _$LmsEducationTermsToJson(LmsEducationTerms instance) =>
    <String, dynamic>{
      'coincidedForeignLanguage': instance.coincidedForeignLanguage,
      'idLmsEducationTerm': instance.idLmsEducationTerm,
      'subjectNameByApi': instance.subjectNameByApi,
    };
