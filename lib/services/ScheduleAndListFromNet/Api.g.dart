// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String,
      fields[7] as String?,
      (fields[8] as List?)?.cast<String>(),
      fields[0] as int,
      fields[9] as String,
      fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.middleName)
      ..writeByte(4)
      ..write(obj.degree)
      ..writeByte(5)
      ..write(obj.rank)
      ..writeByte(6)
      ..write(obj.photoLink)
      ..writeByte(7)
      ..write(obj.calendarId)
      ..writeByte(8)
      ..write(obj.academicDepartment)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.urlId)
      ..writeByte(10)
      ..write(obj.fio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 1;

  @override
  Group read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Group(
      fields[0] as int,
      fields[1] as String?,
      fields[2] as int?,
      fields[3] as String?,
      fields[4] as int?,
      fields[5] as String?,
      fields[6] as int?,
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.facultyId)
      ..writeByte(3)
      ..write(obj.facultyName)
      ..writeByte(4)
      ..write(obj.specialityDepartmentEducationFormId)
      ..writeByte(5)
      ..write(obj.specialityName)
      ..writeByte(6)
      ..write(obj.course)
      ..writeByte(7)
      ..write(obj.calendarId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['middleName'] as String?,
      json['degree'] as String?,
      json['rank'] as String?,
      json['photoLink'] as String,
      json['calendarId'] as String?,
      (json['academicDepartment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['id'] as int,
      json['urlId'] as String,
      json['fio'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'degree': instance.degree,
      'rank': instance.rank,
      'photoLink': instance.photoLink,
      'calendarId': instance.calendarId,
      'academicDepartment': instance.academicDepartment,
      'id': instance.id,
      'urlId': instance.urlId,
      'fio': instance.fio,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      json['id'] as int,
      json['name'] as String?,
      json['facultyId'] as int?,
      json['facultyName'] as String?,
      json['specialityDepartmentEducationFormId'] as int?,
      json['specialityName'] as String?,
      json['course'] as int?,
      json['calendarId'] as String?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facultyId': instance.facultyId,
      'facultyName': instance.facultyName,
      'specialityDepartmentEducationFormId':
          instance.specialityDepartmentEducationFormId,
      'specialityName': instance.specialityName,
      'course': instance.course,
      'calendarId': instance.calendarId,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://iis.bsuir.by/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Post>> getTasks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
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
              'employees/all',
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
  Future<List<Group>> getGroups() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Group>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'student-groups',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Group.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ScheduleInfo> getGroupSchedule(group) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ScheduleInfo>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'schedule?studentGroup=${group}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleInfo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ScheduleInfo> getTutorSchedule(group) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ScheduleInfo>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'employees/schedule/${group}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleInfo.fromJson(_result.data!);
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
