import 'package:dio/dio.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

class DepartmentsManager
{
  static final dio = Dio();
  static final apiService = DepartmentsClient(dio);

  static Future<List<DepartmentContainer>?> GetDepartments() async
  {
    try {
      final response = await apiService.getDepartments();
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Post>?> GetTutorsDepartment(int departmentId) async
  {
    try {
      final response = await apiService.getTutorsDepartment(departmentId);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

}