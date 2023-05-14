import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_parse/flutter_parse.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'dart:io';
import 'package:logger/logger.dart';

final logger = Logger();

class DepartmentsManager
{
  static final dio = Dio();
  static final apiService = DepartmentsClient(dio);

  static Future<Phones?> GetPhonePage (
      int currentPage, int pageSize, String searchValue
      ) async
  {
    try {
      final body = PhonePayload(currentPage, pageSize, searchValue);
      final response = await apiService.getPhones(body);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }


  static Future<List<DepartmentContainer>?> GetDepartments() async
  {
    try {
      final response = await apiService.getDepartments();
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Department>?> GetDepartmentsNonTree() async
  {
    try {
      final response = await apiService.getDepartmentsNonTree();
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

  static Future<String?> GetExcel(int departmentId) async
  {
    try {
      final response = await apiService.getExcel(departmentId);
     // ParseFile ref = ParseFile(name: "Tempa", fileBytes: fileBytes)
      return response.data;
    } on DioError catch (e) {
      logger.d(e);
      return null;
    }
  }

  static Future<List<DepartmentAnnouncement>?> GetDepartmentAnouncements(int id) async
  {
    try {
      final response = await apiService.getDepartmentAnouncements(id);
      return response;
    } on DioError catch (e) {

      return null;
    }
  }

}