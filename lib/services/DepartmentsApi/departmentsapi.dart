import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

part 'departmentsapi.g.dart';

@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class DepartmentsClient {
  factory DepartmentsClient(Dio dio, {String baseUrl}) = _DepartmentsClient;
  @GET("departments/tree")
  Future<List<DepartmentContainer>> getDepartments();
  @GET("employees")
  Future<List<Post>> getTutorsDepartment(@Query('departmentId') int departmentId);
}

@JsonSerializable()
class  DepartmentContainer
{
  List<Department>? children;
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

