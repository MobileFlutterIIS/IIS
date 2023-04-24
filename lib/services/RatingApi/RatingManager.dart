import 'package:dio/dio.dart';
import 'package:iis/services/RatingApi/ratingapi.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';


class RatingManager
{
  static final dio = Dio();
  static final apiService = RatingClient(dio);

  static Future<List<Speciality>?> GetSpecialitiesDayOnly(int faciltyid, int entryYear) async
  {
    try {
      final response = await apiService.getSpecialities(faciltyid, entryYear);
      List<Speciality>? list = [];
      response.forEach((element) {
        if (element.text!.contains('1 ступень дневная'))
          list.add(element);
      });
      return list;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Speciality>?> GetSpecialities(int faciltyid, int entryYear) async
  {
    try {
      final response = await apiService.getSpecialities(faciltyid, entryYear);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Speciality>?> GetFaculty() async
  {
    try {
      final response = await apiService.getFaculties();
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

    static Future<List<StudentsRating>?> GetSpecialityRating(int year, int sdef) async
  {
    try {
      final response = await apiService.getSpecialityRating(year, sdef);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }
    static Future<Student?> GetStudentRating(String studentCardNumber) async
  {
    try {
      final response = await apiService.getStudentRating(studentCardNumber);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

}