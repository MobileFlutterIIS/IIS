// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departmentsapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentContainer _$DepartmentContainerFromJson(Map<String, dynamic> json) =>
    DepartmentContainer(
      (json['children'] as List<dynamic>?)
          ?.map((e) => DepartmentContainer.fromJson(e as Map<String, dynamic>))
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

DepartmentAnnouncement _$DepartmentAnnouncementFromJson(
        Map<String, dynamic> json) =>
    DepartmentAnnouncement(
      json['auditory'] as String?,
      json['content'] as String?,
      json['date'] as String?,
      json['employee'] as String?,
      (json['employeeDepartments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['endTime'] as String?,
      json['startTime'] as String?,
      json['urlId'] as String?,
      json['id'] as int?,
      (json['studentGroups'] as List<dynamic>?)
          ?.map((e) => GroupInf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentAnnouncementToJson(
        DepartmentAnnouncement instance) =>
    <String, dynamic>{
      'auditory': instance.auditory,
      'content': instance.content,
      'date': instance.date,
      'employee': instance.employee,
      'employeeDepartments': instance.employeeDepartments,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'urlId': instance.urlId,
      'id': instance.id,
      'studentGroups': instance.studentGroups,
    };

GroupInf _$GroupInfFromJson(Map<String, dynamic> json) => GroupInf(
      json['id'] as int?,
      json['name'] as String?,
      json['zaochOrDist'] as bool?,
    );

Map<String, dynamic> _$GroupInfToJson(GroupInf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'zaochOrDist': instance.zaochOrDist,
    };

Phones _$PhonesFromJson(Map<String, dynamic> json) => Phones(
      (json['auditoryPhoneNumberDtoList'] as List<dynamic>?)
          ?.map((e) => PhoneDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalItems'] as int?,
    );

Map<String, dynamic> _$PhonesToJson(Phones instance) => <String, dynamic>{
      'auditoryPhoneNumberDtoList': instance.auditoryPhoneNumberDtoList,
      'totalItems': instance.totalItems,
    };

PhoneDto _$PhoneDtoFromJson(Map<String, dynamic> json) => PhoneDto(
      json['auditory'] as String?,
      json['buildingAddress'] as String?,
      (json['departments'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['employees'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['note'] as String?,
      (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PhoneDtoToJson(PhoneDto instance) => <String, dynamic>{
      'auditory': instance.auditory,
      'buildingAddress': instance.buildingAddress,
      'departments': instance.departments,
      'employees': instance.employees,
      'note': instance.note,
      'phones': instance.phones,
    };

PhonePayload _$PhonePayloadFromJson(Map<String, dynamic> json) => PhonePayload(
      json['currentPage'] as int?,
      json['pageSize'] as int?,
      json['searchValue'] as String?,
    );

Map<String, dynamic> _$PhonePayloadToJson(PhonePayload instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'searchValue': instance.searchValue,
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
  Future<List<Department>> getDepartmentsNonTree() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<Department>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'departments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Department.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Post>> getTutorsDepartment(int departmentId) async {
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

  @override
  Future<List<DepartmentAnnouncement>> getDepartmentAnouncements(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DepartmentAnnouncement>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'announcements/departments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            DepartmentAnnouncement.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<HttpResponse<String>> getExcel(int departmentId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'department-id': departmentId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<String>(_setStreamType<HttpResponse<String>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'departments/report',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<Phones> getPhones(PhonePayload payload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payload.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Phones>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'phone-book/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Phones.fromJson(_result.data!);
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
