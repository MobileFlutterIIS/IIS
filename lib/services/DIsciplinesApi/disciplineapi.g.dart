// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disciplineapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discipline _$DisciplineFromJson(Map<String, dynamic> json) => Discipline(
      json['hours'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DisciplineToJson(Discipline instance) =>
    <String, dynamic>{
      'hours': instance.hours,
      'name': instance.name,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DisciplineClient implements DisciplineClient {
  _DisciplineClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iis.bsuir.by/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Discipline>> getDisciplines(
    id,
    year,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'year': year,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<Discipline>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'list-disciplines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Discipline.fromJson(i as Map<String, dynamic>))
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
