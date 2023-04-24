import "package:json_annotation/json_annotation.dart";
import "package:retrofit/retrofit.dart";
import "package:dio/dio.dart";

part 'disciplineapi.g.dart';

@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class DisciplineClient {
  factory DisciplineClient(Dio dio, {String baseUrl}) = _DisciplineClient;
  @GET("list-disciplines?id=20129&year=2022")
  Future<List<Discipline>> getDisciplines(@Query('id') int id, @Query('year') int year);

}

@JsonSerializable()
class  Discipline
{
   int? hours;
   String? name;

   Discipline(this.hours, this.name);

  factory Discipline.fromJson(Map<String, dynamic> json) => _$DisciplineFromJson(json);
  Map<String, dynamic> toJson() => _$DisciplineToJson(this);
}
