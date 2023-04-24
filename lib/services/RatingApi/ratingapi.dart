import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";
import "package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart";

part 'ratingapi.g.dart';


@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class RatingClient {
  factory RatingClient(Dio dio, {String baseUrl}) = _RatingClient;
  @GET("rating/specialities")
  Future<List<Speciality>> getSpecialities(@Query('facultyId') int faciltyid,@Query('entryYear') int entryYear );
  @GET("rating")
  Future<List<StudentsRating>> getSpecialityRating(@Query('year') int year,@Query('sdef') int sdef );
  @GET("rating/studentRating")
  Future<Student> getStudentRating(@Query('studentCardNumber') String studentCardNumber );
  @GET("schedule/faculties")
  Future<List<Speciality>> getFaculties();
}

@JsonSerializable()
class  Speciality
{
  int? id;
  String? text;

  Speciality(this.id, this.text);

  factory Speciality.fromJson(Map<String, dynamic> json) => _$SpecialityFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialityToJson(this);
}

@JsonSerializable()
class  StudentsRating
{
  double? average;
  double? averageShift;
  double? firstAverage;
  double? firstHours;
  double? hours;
  double? secondAverage;
  double? secondHours;
  double? thirdAverage;
  double? thirdHours;
  String? studentCardNumber;


  StudentsRating(
      this.average,
      this.averageShift,
      this.firstAverage,
      this.firstHours,
      this.hours,
      this.secondAverage,
      this.secondHours,
      this.thirdAverage,
      this.thirdHours,
      this.studentCardNumber);

  factory StudentsRating.fromJson(Map<String, dynamic> json) => _$StudentsRatingFromJson(json);
  Map<String, dynamic> toJson() => _$StudentsRatingToJson(this);
}

