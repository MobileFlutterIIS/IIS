import 'package:flutter/material.dart';
import 'package:iis/widgets/LoginScreenComponents/Password.dart';
import 'package:iis/screens/Account/PasswordChange/ConfirmButton.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';

class ChangePassword extends StatefulWidget{
  String password;
  ChangePassword({super.key, required this.password});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passwordOld = TextEditingController();

  final newPassword = TextEditingController();

  final newPasswordRepeat = TextEditingController();

  final passwordResponse = AccountManager();

  String? passwordResult;

  static bool sucs = false;

  Future<bool> initall(String password, String newPassword) async{
    if(sucs) return true;
    passwordResult = (await AccountManager.NewPassword(password, newPassword));
    logger.d(passwordResult);
    sucs = true;
    return true;
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sucs = false;
    super.dispose();
  }

  bool oldPasswordIsRight(String passwordOld){
    bool isRight = true;
    if(widget.password != passwordOld){
      isRight = false;
    }
    return isRight;
  }

  int newPasswordRepeatCorrectly(String passwordOld, String newPassword, String newPasswordRepeat){
    int isRight = 1;
    if(oldPasswordIsRight(passwordOld)){
      if(newPassword!=newPasswordRepeat){
        isRight = 2;
      }
    }
    else{
      isRight = 3;
    }
    return isRight;
  }

  Future<String> setResponse(String passwordOld, String newPassword) async{
    String? passwordRight = (await AccountManager.NewPassword(passwordOld, newPassword));
    if(passwordRight!=null || passwordRight!=''){
      return passwordRight!;
    }
    else{
      return 'null';
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color.fromRGBO(22, 49, 99, 0.9),
              centerTitle: true,
              title: const Text('С М Е Н А  П А Р О Л Я'),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [

                    const SizedBox(height: 160),
                    Password(
                      controller: passwordOld,
                      hintText: 'Старый пароль',
                      obsecureText: true,
                    ),
                    const SizedBox(height: 10),
                    Password(
                      controller: newPassword,
                      hintText: 'Новый пароль',
                      obsecureText: true,
                    ),
                    const SizedBox(height: 10),
                    Password(
                      controller: newPasswordRepeat,
                      hintText: 'Подтвердите пароль',
                      obsecureText: true,
                    ),
                    const SizedBox(height: 20,),
                    ConfirmButton(
                      onTap: () {
                        if (newPasswordRepeatCorrectly(
                            passwordOld.text, newPassword.text,
                            newPasswordRepeat.text) == 3) {
                          print('неверный старый');
                        }
                        else if (newPasswordRepeatCorrectly(
                            passwordOld.text, newPassword.text,
                            newPasswordRepeat.text) == 2) {
                          print('неверный новый повтор');
                        }
                        else {
                          print('все ок');
                          initall(passwordOld.text, newPassword.text);
                          print(passwordResult);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}