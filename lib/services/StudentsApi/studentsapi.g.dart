// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentsapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsPage _$StudentsPageFromJson(Map<String, dynamic> json) => StudentsPage(
      (json['course'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['currentPage'] as int?,
      (json['cvs'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['faculties'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['lastName'] as String?,
      json['pageSize'] as int?,
      json['searchJob'] as bool?,
      (json['skills'] as List<dynamic>).map((e) => e as int?).toList(),
      json['totalItems'] as int?,
      json['totalPages'] as int?,
    );

Map<String, dynamic> _$StudentsPageToJson(StudentsPage instance) =>
    <String, dynamic>{
      'course': instance.course,
      'currentPage': instance.currentPage,
      'cvs': instance.cvs,
      'faculties': instance.faculties,
      'lastName': instance.lastName,
      'pageSize': instance.pageSize,
      'searchJob': instance.searchJob,
      'skills': instance.skills,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };

StudentPayload _$StudentPayloadFromJson(Map<String, dynamic> json) =>
    StudentPayload(
      (json['course'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['currentPage'] as int?,
      (json['faculties'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['lastName'] as String?,
      json['searchJob'] as bool?,
      (json['skills'] as List<dynamic>).map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$StudentPayloadToJson(StudentPayload instance) =>
    <String, dynamic>{
      'course': instance.course,
      'currentPage': instance.currentPage,
      'faculties': instance.faculties,
      'lastName': instance.lastName,
      'searchJob': instance.searchJob,
      'skills': instance.skills,
    };

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _StudentsClient implements StudentsClient {
  _StudentsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iis.bsuir.by/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Skill>> getSkills(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': name};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Skill>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'skill',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Skill.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<StudentsPage> getStudentPage(payload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payload.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<StudentsPage>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'profiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StudentsPage.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
