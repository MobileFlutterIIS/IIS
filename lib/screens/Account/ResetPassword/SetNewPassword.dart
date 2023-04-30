import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';


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
        title: const Text('Н О В Ы Й   П А Р О Л Ь'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2 - 350),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Color.fromRGBO(54, 84, 140, 0.9),
                  child: Icon(
                    Icons.lock,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 280,
                  height: 40,
                  child: TextField(
                    controller: passwordController,
                    obscureText: false,
                    style: const TextStyle(height: 0.6, color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Пароль',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
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
                    style: const TextStyle(height: 0.6, color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Подтвердите пароль',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 40,
                      child: TextField(
                        controller: codeController,
                        obscureText: false,
                        style: const TextStyle(height: 0.6, color: Colors.black),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Код',
                          hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        getCode(widget.contactValue!, widget.login!);
                      },
                      child: const Text(
                        'Получить код',
                        style: TextStyle(
                          color: Color.fromRGBO(54, 84, 140, 0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                  onPressed: () {
                    sendPassword(widget.contactValue!, widget.login!);
                  },
                  child: const Text(
                    'Создать',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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