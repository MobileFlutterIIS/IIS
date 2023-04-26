import 'package:flutter/material.dart';
import 'package:iis/widgets/LoginScreenComponents/Password.dart';
import 'package:iis/widgets/LoginScreenComponents/SignInButton.dart';
import 'package:iis/widgets/LoginScreenComponents/UserName.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GetUserNameAndPassword.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/api_service.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:iis/screens/Account/AccountPage.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class UserLogin extends StatelessWidget{
  UserLogin({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  String? username;
  String? password;

  String GetUsername(){
    return setUsername(userNameController);
  }
  String GetPassword(){
    return setPassword(passwordController);
  }

  // void signUserIn(BuildContext context) async {
  //   final dio = Dio();
  //   final apiService = ApiService(dio);
  //   final loginResponse = await loginToAccount(GetUsername(), GetPassword());
  //   String cookie = "";
  //   dio.interceptors.add(
  //       InterceptorsWrapper(onRequest: (options, handler) {
  //         cookie =loginResponse.cookie.toString();
  //         options.headers.addAll({"cookie": cookie});
  //         return handler.next(options);
  //       })
  //   );
  //   try {
  //     final response = await apiService.getUserProfile(cookie);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => AccountPage(user: response, cookie: cookie)),
  //     );
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }

  void signUserIn(BuildContext context) async {
    try {
      final response = await AccountManager.signIn(GetUsername(), GetPassword());
      if (response == null) throw 'e';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPage(user: response, password: GetPassword(),)),
      );
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Center(
        child: Column(
          children: [

            const SizedBox(height: 200),
            UserName(
              nameController: userNameController,
              nameHintText: 'Пользователь',
              nameObsecureText: false,
            ),

            const SizedBox(height: 10),
            Password(
              controller: passwordController,
              hintText: 'Пароль',
              obsecureText: true,
            ),

            // const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 60),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Text(
            //         'Забыли пароль?',
            //         style: TextStyle(color: Colors.grey[600]),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 25),
            SignInButton(
              onTap: () => signUserIn(context), // Передаем контекст в функцию
            ),
          ],
        ),
      ),
    ),
  );
}