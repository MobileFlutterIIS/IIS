import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/auth_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

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
}