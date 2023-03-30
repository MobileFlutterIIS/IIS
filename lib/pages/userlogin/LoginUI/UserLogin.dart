import 'package:flutter/material.dart';
import 'package:iis/pages/userlogin/LoginUI/Components/UserName.dart';
import 'package:iis/pages/userlogin/LoginUI/Components/Password.dart';
import 'package:iis/pages/userlogin/LoginUI/Components/SignInButton.dart';
import 'package:iis/pages/userlogin/CheckValidatingUserAndPassword/GetUserNameAndPassword.dart';
import 'package:iis/pages/userlogin/CheckValidatingUserAndPassword/SendRequest.dart';
import 'package:iis/pages/AccPage/AccountPage.dart';

class UserLogin extends StatelessWidget{
  UserLogin({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  String? username;
  String? password;

  String GetUsername(){
    //print(userNameController.text);
    return setUsername(userNameController);
  }
  String GetPassword(){
    //print(passwordController.text);
    return setPassword(passwordController);
  }

  void signUserIn() async {
    //final userProfile = await post(setUsername(userNameController), setPassword(passwordController));

    // final userProfile = await getUserProfile(GetUsername(), GetPassword());
    // if (userProfile == null) {
    //   print('rr');
    // } else {
    //   final a = userProfile;
    //   AccountPage();
    // }
    Session cookieResponse = new Session();
    final reasponseCookie = await cookieResponse.post('https://iis.bsuir.by/api/v1/auth/login', getData(GetUsername(), GetPassword()));
    print(reasponseCookie.toString());
    
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
              obsecureText: false,
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Забыли пароль?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            SignInButton(
              onTap: signUserIn,
            ),
          ],
        ),
      ),
    ),
  );
}