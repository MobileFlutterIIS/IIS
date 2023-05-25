import 'package:flutter/material.dart';
import 'package:iis/screens/Account/ResetPassword/ChoosingEmailOrPhonenumber.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:retrofit/http.dart';
import 'package:another_flushbar/flushbar.dart';

class ForgetPassword extends StatefulWidget{

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final loginController = TextEditingController();
  ContactsToReset? contactsToReset;

  Future<void> CheckingLogin() async{
    print(loginController.text);
    contactsToReset = await AccountManager.CheckPassword(loginController.text);
    print('get');
    if(contactsToReset!=null){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChoosingEmailOrPhonenumber(contactsToReset: contactsToReset!, login: loginController.text,),
      ));
    }
    else{
      print('wrongLogin');
      Flushbar(
        backgroundColor: Theme.of(context).cardColor,
        messageColor: Theme.of(context).hintColor,
        message: "Ошибка! Не удалось найти аккаунт",
        icon: Icon(
          Icons.warning,
          size: 28.0,
          color:Theme.of(context).hintColor,
        ),
        duration: Duration(seconds: 3),
        isDismissible: true,
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Восстановление пароля',
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
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2 - 250),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Column(
                  children: const [
                    Text(
                      'Для восстановления пароля',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    Text(
                      'введите логин, используемый',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    Text(
                        'для входа',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  width: 240,
                  height: 40,
                  child: TextField(
                    controller: loginController,
                    obscureText: false,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Введите логин',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                  onPressed: CheckingLogin,
                  child: const Text(
                    'Отправить',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
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