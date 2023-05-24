// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratingapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) => Speciality(
      json['id'] as int?,
      json['text'] as String?,
    );

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

StudentsRating _$StudentsRatingFromJson(Map<String, dynamic> json) =>
    StudentsRating(
      (json['average'] as num?)?.toDouble(),
      (json['averageShift'] as num?)?.toDouble(),
      (json['firstAverage'] as num?)?.toDouble(),
      (json['firstHours'] as num?)?.toDouble(),
      (json['hours'] as num?)?.toDouble(),
      (json['secondAverage'] as num?)?.toDouble(),
      (json['secondHours'] as num?)?.toDouble(),
      (json['thirdAverage'] as num?)?.toDouble(),
      (json['thirdHours'] as num?)?.toDouble(),
      json['studentCardNumber'] as String?,
    )..index = json['index'] as int?;

Map<String, dynamic> _$StudentsRatingToJson(StudentsRating instance) =>
    <String, dynamic>{
      'index': instance.index,
      'average': instance.average,
      'averageShift': instance.averageShift,
      'firstAverage': instance.firstAverage,
      'firstHours': instance.firstHours,
      'hours': instance.hours,
      'secondAverage': instance.secondAverage,
      'secondHours': instance.secondHours,
      'thirdAverage': instance.thirdAverage,
      'thirdHours': instance.thirdHours,
      'studentCardNumber': instance.studentCardNumber,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RatingClient implements RatingClient {
  _RatingClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iis.bsuir.by/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Speciality>> getSpecialities(
    int faciltyid,
    int entryYear,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'facultyId': faciltyid,
      r'entryYear': entryYear,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<Speciality>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'rating/specialities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Speciality.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<StudentsRating>> getSpecialityRating(
    int year,
    int sdef,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'year': year,
      r'sdef': sdef,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<StudentsRating>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'rating',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => StudentsRating.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Student> getStudentRating(String studentCardNumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'studentCardNumber': studentCardNumber
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Student>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'rating/studentRating',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Student.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Speciality>> getFaculties() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<Speciality>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'schedule/faculties',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Speciality.fromJson(i as Map<String, dynamic>))
        .toList();
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
