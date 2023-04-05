import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import 'package:hive/hive.dart';
import 'package:iis/services/ScheduleAndListFromNet/ApiSchedule.dart';

part 'Api.g.dart';


@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("employees/all")
  Future<List<Post>> getTasks();
  @GET("student-groups")
  Future<List<Group>> getGroups();
  @GET("schedule?studentGroup={groupNumber}")
  Future<ScheduleInfo> getGroupSchedule(@Path("groupNumber") String group);
  @GET("employees/schedule/{urlId}")
  Future<ScheduleInfo> getTutorSchedule(@Path("urlId") String group);
}

@JsonSerializable()
@HiveType(typeId: 0)
class Post{
 @HiveField(1)
  String firstName;
 @HiveField(2)
  String lastName;
 @HiveField(3)
  String middleName;
 @HiveField(4)
  String? degree;
 @HiveField(5)
  String? rank;
 @HiveField(6)
  String photoLink;
 @HiveField(7)
  String? calendarId;
 @HiveField(8)
  List<String>? academicDepartment;
 @HiveField(0)
  int id;
 @HiveField(9)
  String urlId;
 @HiveField(10)
  String? fio;


  Post(
      this.firstName,
      this.lastName,
      this.middleName,
      this.degree,
      this.rank,
      this.photoLink,
      this.calendarId,
      this.academicDepartment,
      this.id,
      this.urlId,
      this.fio);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class Group {
 @HiveField(0)
 int id;
 @HiveField(1)
 String? name;
 @HiveField(2)
 int? facultyId;
 @HiveField(3)
 String? facultyName;
 @HiveField(4)
 int? specialityDepartmentEducationFormId;
 @HiveField(5)
 String? specialityName;
 @HiveField(6)
 int? course;
 @HiveField(7)
 String? calendarId;

 Group(
      this.id,
      this.name,
      this.facultyId,
      this.facultyName,
      this.specialityDepartmentEducationFormId,
      this.specialityName,
      this.course,
      this.calendarId);

 factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
 Map<String, dynamic> toJson() => _$GroupToJson(this);
}

