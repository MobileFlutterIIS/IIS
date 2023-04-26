// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departmentsapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentContainer _$DepartmentContainerFromJson(Map<String, dynamic> json) =>
    DepartmentContainer(
      (json['children'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['data'] == null
          ? null
          : Department.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentContainerToJson(
        DepartmentContainer instance) =>
    <String, dynamic>{
      'children': instance.children,
      'data': instance.data,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      json['abbrev'] as String?,
      json['code'] as String?,
      json['id'] as int?,
      json['idHead'] as int?,
      json['name'] as String?,
      json['numberOfEmployee'] as int?,
      json['oldCode'] as String?,
      json['typeId'] as int?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'abbrev': instance.abbrev,
      'code': instance.code,
      'id': instance.id,
      'idHead': instance.idHead,
      'name': instance.name,
      'numberOfEmployee': instance.numberOfEmployee,
      'oldCode': instance.oldCode,
      'typeId': instance.typeId,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DepartmentsClient implements DepartmentsClient {
  _DepartmentsClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iis.bsuir.by/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DepartmentContainer>> getDepartments() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<DepartmentContainer>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'departments/tree',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            DepartmentContainer.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Post>> getTutorsDepartment(departmentId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'departmentId': departmentId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Post>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'employees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Post.fromJson(i as Map<String, dynamic>))
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
