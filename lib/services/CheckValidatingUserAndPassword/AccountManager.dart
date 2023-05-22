import 'dart:math';

import 'package:dio/dio.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/DormDipPenalty.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

final logger = Logger();

// Управление всеми запросами данных о пользователе
class AccountManager
{
  static final dio = Dio();
  static final apiService = ApiService(dio);
  static String cookie = "";

  static Future<void> saveCredentials(String username, String userpassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('userpassword', userpassword);
  }

  static Future<Map<String, String>> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final userpassword = prefs.getString('userpassword');
    return {'username': username ?? '', 'userpassword': userpassword ?? ''};
  }

  static Future<void> removeCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('userpassword');
  }

  static Future<UserEntity?> signIn(String username, String userpassword) async
  {
    final loginResponse = await loginToAccount(username, userpassword);
  dio.interceptors.add(
  InterceptorsWrapper(onRequest: (options, handler) {
  cookie = loginResponse.cookie.toString();
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

  static Future<List<Anouncement>?> UserNotifications() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserNotifications(cookie);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<MarkSheet>?> UserMarkSheets() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserMarkSheet(cookie);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<Markbook?> UserMarkBook() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getUserMarkBook(cookie);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

   static Future<List<GradeBook>?> UserGradeBook() async{
     if (cookie == '' || cookie == null) return null;
     try {
       final response = await apiService.getUserGradeBook(cookie);
       print(response.toString());
       return response;
     } on DioError catch (e) {
       return null;
     }
   }

   static Future<List<Omission>?> UserOmissions() async{
     if (cookie == '' || cookie == null) return null;
     try {
       final response = await apiService.getUserOmissions(cookie);
       print(response.toString());
       return response;
     } on DioError catch (e) {
       return null;
     }
   }

  static Future<String?> NewPassword(String password, String newPassword) async{
    if (cookie == '' || cookie == null) return null;
    try {
      Map<String, dynamic> data = {
        'password': password,
        'newPassword': newPassword,
      };
      final response = await apiService.setNewPassword(cookie, data);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  static Future<ContactsToReset?> CheckPassword(String login) async{
    try {
      final response = await apiService.checkPassword(login);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  static Future<ContactsToReset?> PhoneNumberToResetPassword(String contactValue, String login) async{
    try {
      Map<String, dynamic> data = {
        'contactValue': contactValue,
        'login': login,
      };
      final response = await apiService.setPhoneNumberToResetPassword(data);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  static Future<String?> CodeToResetPassword(String contactValue, String login) async{
    try {
      Map<String, dynamic> data = {
        'contactValue': contactValue,
        'login': login,
      };
      final response = await apiService.getCodeToResetPassword(data);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  static Future<String?> NewResetedPassword(String confirmCode, String contactValue, String login, String password) async{
    try {
      Map<String, dynamic> data = {
        'confirmCode': confirmCode,
        'contactValue': contactValue,
        'login': login,
        'password': password,
      };
      final response = await apiService.setNewResetedPassword(data);
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  /// из докума по image_picker
  ///
  /// No configuration required - the plugin should work out of the box.
  /// It is however highly recommended to prepare for Android killing the application when low on memory.
  /// How to prepare for this is discussed in the Handling MainActivity destruction on Android section.


  static Future<String?> SetUserImage() async{
    if (cookie == '' || cookie == null) return null;
    final image;
    final ImagePicker picker = ImagePicker();
    XFile? imgfile = await picker.pickImage(source: ImageSource.gallery);
    logger.d(imgfile!.path);
    image = 'data:image/jpeg;base64,${base64Encode(await File(imgfile!.path)!.readAsBytes())}';
    //${getFileExtension(imgfile!.path)}
    logger.v(image);
    logger.v(image[image.length-1]);
    logger.d(image.length);
    try {
      final response = await apiService.setUserImage(cookie,image);
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<PlaceType>?> GetPlaces() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getPlaces(cookie);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<String>?> GetDebts() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getDebts(cookie);
     // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<DormReq>?> GetDormReqs() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getDormReqs(cookie);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<String>?> GetPriviliges() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getPriviliges(cookie);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<List<String>?> GetApplicationHistory() async{
    if (cookie == '' || cookie == null) return null;
    try {
      final response = await apiService.getApplicationHistory(cookie);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

  static Future<Certificate?> SentCertificateRequest(int count, String type, String place, String comment ) async{
    if (cookie == '' || cookie == null) return null;
    try {
      String placecom = comment.isEmpty? place: place+' ('+comment+')';
      var tdo = CertificateDTO(type, placecom);
      var body = CertificateBody(count,tdo);
      logger.d('${tdo.provisionPlace}, ${tdo.certificateType}, ${count}');
      final response = await apiService.sentCertificateRequest(cookie,body);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      return null;
    }
  }

}

String? getFileExtension(String fileName) {
  try {
    return fileName.split('.').last;
  } catch(e){
    return null;
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