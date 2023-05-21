import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/screens/Account/UserLogin.dart';

class SetNewPassword extends StatefulWidget{
  final String? contactValue;
  final String? login;
  const SetNewPassword({
    super.key,
    this.contactValue,
    this.login,
  });

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final codeController = TextEditingController();

  void getCode(String contactValue, String login) async{
    if(passwordController.text=="" || repeatPasswordController.text==""){
      print("Надо ввести пароль");
    }
    else{
      String? responce = await AccountManager.CodeToResetPassword(contactValue, login);
      if(responce==null){
        print("а э");
      }
    }
  }

  void sendPassword(String contactValue, String login) async{
    if(passwordController.text!="" && repeatPasswordController.text!=""){
      if(passwordController.text==repeatPasswordController.text){
        String? responce = await AccountManager.NewResetedPassword(
            codeController.text,
            contactValue,
            login,
            passwordController.text
        );
        Navigator.pop(context);
      }
      else{
        print("Пароли не верны");
      }
    }
    else{
      print("Надо ввести пароль");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Новый пароль',
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2 - 350),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 280,
                  height: 40,
                  child: TextField(
                    controller: passwordController,
                    obscureText: false,
                    style: const TextStyle(
                      //color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      //enabled: passwordController.text.isNotEmpty && repeatPasswordController.text.isNotEmpty,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 280,
                  height: 40,
                  child: TextField(
                    controller: repeatPasswordController,
                    obscureText: false,
                    style: const TextStyle(
                      //color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Подтвердите пароль',
                      //enabled: passwordController.text.isNotEmpty && repeatPasswordController.text.isNotEmpty,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      child: TextField(
                        controller: codeController,
                        obscureText: false,
                        style: const TextStyle(
                          //color: Colors.black,
                          fontFamily: 'NotoSerif',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Код',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: Colors.white,
                      // ),
                      onPressed: passwordController.text.isNotEmpty && repeatPasswordController.text.isNotEmpty ? () {
                        getCode(widget.contactValue!, widget.login!);
                      } : null,
                      child: const Text(
                        'Получить код',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSerif',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  // ),
                  onPressed: codeController.text.isNotEmpty ? () {
                    sendPassword(widget.contactValue!, widget.login!);
                  } : null,
                  child: const Text(
                    'Создать',
                    style: TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSerif',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}