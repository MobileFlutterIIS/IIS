import 'package:dio/dio.dart';
import 'package:iis/services/DIsciplinesApi/disciplineapi.dart';

class DisciplineManager
{
  static final dio = Dio();
  static final apiService = DisciplineClient(dio);

  static Future<List<Discipline>?> GetDisciplines(int id, int year) async
  {
    try {
      final response = await apiService.getDisciplines(id, year);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

}