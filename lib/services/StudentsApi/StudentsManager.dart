import 'package:dio/dio.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/StudentsApi/studentsapi.dart';

class StudentManager
{
  static final dio = Dio();
  static final apiService = StudentsClient(dio);

 static Future<List<Skill>?> GetSkills (String name) async
 {
   try {
     final response = await apiService.getSkills(name);
     return response;
   } on DioError catch (e) {
     return null;
   }
 }
 static Future<StudentsPage?> GetStudentPage (List<int>? course,
  int? currentPage,
  List<int>? faculties,
  String? lastName,
  bool? searchJob,
  List<int?> skills,) async
 {
   try {
     final body = StudentPayload(course, currentPage, faculties, lastName, searchJob, skills);
     final response = await apiService.getStudentPage(body);
     return response;
   } on DioError catch (e) {
     return null;
   }
 }

}