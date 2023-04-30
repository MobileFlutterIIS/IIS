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
import 'package:iis/screens/Account/ResetPassword/ForgetPassword.dart';

final logger = Logger();

class UserLogin extends StatefulWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  UserLogin({super.key, required this.backgroundcolor, required this.primarycolor});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
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

  void signUserIn(BuildContext context) async {
    try {
      final response = await AccountManager.signIn(GetUsername(), GetPassword());
      if (response == null) throw 'e';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            AccountPage(
              user: response,
              password: GetPassword(),
              background: widget.backgroundcolor,
              primary: widget.primarycolor,
            )),
      );
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.backgroundcolor,
    body: SafeArea(
      child: Center(
        child: Column(
          children: [

            const SizedBox(height: 200),
            UserName(
              nameController: userNameController,
              nameHintText: 'Пользователь',
              nameObsecureText: false,
              backgroundcolor: widget.backgroundcolor,
              primarycolor: widget.primarycolor,
            ),

            const SizedBox(height: 10),
            Password(
              controller: passwordController,
              hintText: 'Пароль',
              obsecureText: true,
              // backgroundcolor: widget.backgroundcolor,
              // primarycolor: widget.primarycolor,
            ),

            const SizedBox(height: 8,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgetPassword()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.primarycolor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            SignInButton(
              onTap: () => signUserIn(context),
              backgroundcolor: widget.backgroundcolor,
              primarycolor: widget.primarycolor,
            ),
          ],
        ),
      ),
    ),
  );
}