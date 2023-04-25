import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';

part 'studentsapi.g.dart';


@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class StudentsClient {
  factory StudentsClient(Dio dio, {String baseUrl}) = _StudentsClient;
  @GET("skill")
  Future<List<Skill>> getSkills(@Query('name') String name );
  @POST("profiles")
  Future<StudentsPage> getStudentPage(@Body() StudentPayload payload );

}

@JsonSerializable()
class StudentsPage
{
  List<int>? course;
  int? currentPage;
  List<UserEntity>? cvs;
  List<int>? faculties;
  String? lastName;
  int? pageSize;
  bool? searchJob;
  List<int?> skills;
  int? totalItems;
  int? totalPages;


  StudentsPage(
      this.course,
      this.currentPage,
      this.cvs,
      this.faculties,
      this.lastName,
      this.pageSize,
      this.searchJob,
      this.skills,
      this.totalItems,
      this.totalPages);

  factory StudentsPage.fromJson(Map<String, dynamic> json) => _$StudentsPageFromJson(json);
  Map<String, dynamic> toJson() => _$StudentsPageToJson(this);
}

@JsonSerializable()
class StudentPayload
{
  List<int>? course;
  int? currentPage;
  List<int>? faculties;
  String? lastName;
  bool? searchJob;
  List<int?> skills;


  StudentPayload(this.course, this.currentPage, this.faculties, this.lastName,
      this.searchJob, this.skills);

  factory StudentPayload.fromJson(Map<String, dynamic> json) => _$StudentPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$StudentPayloadToJson(this);
}

@JsonSerializable()
class Skill
{
  int? id;
  String? name;

  Skill(this.id, this.name);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
