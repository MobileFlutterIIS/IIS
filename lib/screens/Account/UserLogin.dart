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
import 'package:iis/widgets/NavBarAccount.dart';

final logger = Logger();

class UserLogin extends StatefulWidget{
  // final Color backgroundcolor;
  // final Color primarycolor;
  UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  String? username;

  String? password;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tryAutoLogin();
  }

  Future<void> _tryAutoLogin() async {
    setState(() {
      _isLoading = true;
    });

    final credentials = await AccountManager.getCredentials();
    if (credentials.isNotEmpty && credentials['username'] != null && credentials['userpassword'] != null) {
      final user = await AccountManager.signIn(credentials['username']!, credentials['userpassword']!);
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage(
            user: user,
            password: credentials['userpassword']!,
            // background: widget.backgroundcolor,
            // primary: widget.primarycolor,
          )),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  String GetUsername() {
    return setUsername(userNameController);
  }

  String GetPassword() {
    return setPassword(passwordController);
  }


  // void signUserIn(BuildContext context) async {
  //   try {
  //     dynamic response;
  //     Map<String, String> credentials = await AccountManager.getCredentials();
  //     if (credentials.isEmpty || credentials['username'] == '' ||
  //         credentials['userpassword'] == '') {
  //       response = await AccountManager.signIn(
  //           GetUsername(), GetPassword());
  //     }
  //     else {
  //       response = await AccountManager.signIn(
  //           credentials['username']!, credentials['userpassword']!);
  //     }
  //     if (response == null) throw 'e';
  //
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) =>
  //           AccountPage(
  //             user: response,
  //             password: GetPassword(),
  //             background: widget.backgroundcolor,
  //             primary: widget.primarycolor,
  //           )),
  //     );
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> _handleSignIn(String username, String password) async {
    setState(() {
      _isLoading = true;
    });

    final user = await AccountManager.signIn(username, password);
    if (user != null) {
      await AccountManager.saveCredentials(username, password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPage(
          user: user,
          password: password,

        )),
      );
    } else {
      // Handle sign-in error.
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Личный кабинет',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black, // Цвет иконки
        ),
      ),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 200),
              UserName(
                nameController: userNameController,
                nameHintText: 'Пользователь',
                nameObsecureText: false,
                // backgroundcolor: widget.backgroundcolor,
                // primarycolor: widget.primarycolor,
              ),

              const SizedBox(height: 10),
              Password(
                controller: passwordController,
                hintText: 'Пароль',
                obsecureText: true,
              ),

              const SizedBox(height: 6,),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPassword()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              SignInButton(
                onTap: () => _handleSignIn(userNameController.text, passwordController.text),
                // backgroundcolor: widget.backgroundcolor,
                // primarycolor: widget.primarycolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}