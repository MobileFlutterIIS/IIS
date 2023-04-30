import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:logger/logger.dart';

part 'api_service.g.dart';

class LoginResponseDto {
  String? cookie;

  LoginResponseDto({this.cookie});



  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      cookie: json['cookie'],
    );
  }
}

Future<LoginResponseDto> loginToAccount(String name, String password) async {
  final Dio dio = Dio();

  try {
    final response = await dio.post(
      'https://iis.bsuir.by/api/v1/auth/login',
      data: {
        'username': name,
        'password': password,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    final cookie = response.headers.value('set-cookie');
    final loginResponse = LoginResponseDto(cookie: cookie);

    return loginResponse;
  } on DioError catch (e) {
    print(e);
    throw e;
  }
}



@RestApi(baseUrl: "https://iis.bsuir.by/api/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

//  @POST("auth/login")
//  Future<LoginResponseDto> loginToAccount(@Body() Map<String, dynamic> request);

  @GET('profiles/personal-cv')
  Future<UserEntity> getUserProfile(@Header('cookie') String cookie);
  @GET('certificate')
  Future<List<Certificate>> getUserCertificates(@Header('cookie') String cookie);
  @GET('student-groups/user-group-info')
  Future<Groupinfo> getUserGroupInfo(@Header('cookie') String cookie);
  @GET('announcements')
  Future<List<Anouncement>> getUserNotifications(@Header('cookie') String cookie);
  @GET('mark-sheet')
  Future<List<MarkSheet>> getUserMarkSheet(@Header('cookie') String cookie);
  @GET('markbook')
  Future<Markbook> getUserMarkBook(@Header('cookie') String cookie);
  @GET('grade-book')
  Future<List<GradeBook>> getUserGradeBook(@Header('cookie') String cookie);
  @GET('omissions-by-student')
  Future<List<Omission>> getUserOmissions(@Header('cookie') String cookie);
  @POST('profiles/my-photo')
  Future<String> setUserImage(
  @Header('cookie') String cookie,
  @Body() String photo,{
  @Header('accept') String accept = 'text/plain',
  @Header('content-type') String contentType = 'text/plain'});
  @POST('settings/password/change')
  Future<String> setNewPassword(
      @Header('cookie') String cookie,
      @Body() Map<String, dynamic> data,
      );
  @GET('settings/masked-contacts?')
  Future<ContactsToReset> checkPassword(
      @Query('login') String user,
      );
  @POST('settings/contact/exist')
  Future<ContactsToReset> setPhoneNumberToResetPassword(
      @Body() Map<String, dynamic> data,
      );
  @POST('settings/password/reset')
  Future<String> getCodeToResetPassword(
      @Body() Map<String, dynamic> data,
      );
  @POST('settings/password/new')
  Future<String> setNewResetedPassword(
      @Body() Map<String, dynamic> data,
      );
}

