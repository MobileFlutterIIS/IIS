import "dart:typed_data";

import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'dart:io';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
//import 'package:excel/excel.dart';

part 'departmentsapi.g.dart';

@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class DepartmentsClient {
  factory DepartmentsClient(Dio dio, {String baseUrl}) = _DepartmentsClient;
  @GET("departments/tree")
  Future<List<DepartmentContainer>> getDepartments();
  @GET("departments")
  Future<List<Department>> getDepartmentsNonTree();
  @GET("employees")
  Future<List<Post>> getTutorsDepartment(@Query('departmentId') int departmentId);
  @GET("announcements/departments")
  Future<List<DepartmentAnnouncement>> getDepartmentAnouncements(@Query('id') int id);
  @GET("departments/report")
  Future<HttpResponse<String>> getExcel(@Query('department-id') int departmentId);
  @POST("phone-book/")
  Future<Phones> getPhones(@Body() PhonePayload payload);
}

@JsonSerializable()
class  DepartmentContainer
{
  List<DepartmentContainer>? children;
  Department? data;


  DepartmentContainer(this.children, this.data);

  factory DepartmentContainer.fromJson(Map<String, dynamic> json) => _$DepartmentContainerFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentContainerToJson(this);
}
@JsonSerializable()
class  Department
{
  String? abbrev;
  String? code;
  int? id;
  int? idHead;
  String? name;
  int? numberOfEmployee;
  String? oldCode;
  int? typeId;


  Department(this.abbrev, this.code, this.id, this.idHead, this.name,
      this.numberOfEmployee, this.oldCode, this.typeId);


  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class  DepartmentAnnouncement
{
  String? auditory;
  String? content;
  String? date;
  String? employee;
  List<String>? employeeDepartments;
  String? endTime;
  String? startTime;
  String? urlId;
  int? id;
  List<GroupInf>? studentGroups;


  DepartmentAnnouncement(this.auditory, this.content, this.date, this.employee,
      this.employeeDepartments, this.endTime, this.startTime, this.urlId,
      this.id, this.studentGroups);

  factory DepartmentAnnouncement.fromJson(Map<String, dynamic> json) => _$DepartmentAnnouncementFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentAnnouncementToJson(this);
}

@JsonSerializable()
class GroupInf {
  int? id;
  String? name;
  bool? zaochOrDist;


  GroupInf(this.id, this.name, this.zaochOrDist);

  factory GroupInf.fromJson(Map<String, dynamic> json) =>
      _$GroupInfFromJson(json);

  Map<String, dynamic> toJson() => _$GroupInfToJson(this);
}

@JsonSerializable()
class Phones {
  List<PhoneDto>? auditoryPhoneNumberDtoList;
  int? totalItems;


  Phones(this.auditoryPhoneNumberDtoList, this.totalItems);

  factory Phones.fromJson(Map<String, dynamic> json) =>
      _$PhonesFromJson(json);

  Map<String, dynamic> toJson() => _$PhonesToJson(this);
}

@JsonSerializable()
class PhoneDto {
  String? auditory;
  String? buildingAddress;
  List<Department>? departments;
  List<Post>? employees;
  String? note;
  List<String>? phones;

  PhoneDto(this.auditory, this.buildingAddress, this.departments,
      this.employees, this.note, this.phones);

  factory PhoneDto.fromJson(Map<String, dynamic> json) =>
      _$PhoneDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneDtoToJson(this);
}
@JsonSerializable()
class PhonePayload {
  int? currentPage;
  int? pageSize;
 String? searchValue;


  PhonePayload(this.currentPage, this.pageSize, this.searchValue);

  factory PhonePayload.fromJson(Map<String, dynamic> json) =>
      _$PhonePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PhonePayloadToJson(this);
}
