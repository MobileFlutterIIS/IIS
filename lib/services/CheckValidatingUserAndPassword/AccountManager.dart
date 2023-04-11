import 'package:dio/dio.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupNotifications.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:logger/logger.dart';

final logger = Logger();


class AccountManager
{
  static final dio = Dio();
  static final apiService = ApiService(dio);
  static String cookie = "";

  static Future<UserEntity?> signIn(String username, String userpassword) async
  {
    final loginResponse = await loginToAccount(username, userpassword);
  dio.interceptors.add(
  InterceptorsWrapper(onRequest: (options, handler) {
  cookie =loginResponse.cookie.toString();
  options.headers.addAll({"cookie": cookie});
  return handler.next(options);
  })
  );
    try {
      final response = await apiService.getUserProfile(cookie);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Certificate>?> UserCetificate() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserCertificates(cookie);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<Groupinfo?> UserGroupInfo() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserGroupInfo(cookie);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<Notification>?> UserNotifications() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserNotifications(cookie);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

}

// @GET('profiles/personal-cv')
// Future<UserEntity> getUserProfile(@Header('cookie') String cookie);
// @GET('certificate')
// Future<List<Certificate>> getUserCertificates(@Header('cookie') String cookie); @GET('certificate')
// @GET('student-groups/user-group-info')
// Future<Groupinfo> getUserGroupInfo(@Header('cookie') String cookie);
// @GET('announcements')
// Future<List<Notification>> getUserNotifications(@Header('cookie') String cookie);