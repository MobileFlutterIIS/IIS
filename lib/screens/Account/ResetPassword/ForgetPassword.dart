import 'package:flutter/material.dart';
import 'package:iis/screens/Account/ResetPassword/ChoosingEmailOrPhonenumber.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:retrofit/http.dart';

class ForgetPassword extends StatefulWidget{

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final loginController = TextEditingController();
  ContactsToReset? contactsToReset;

  void CheckingLogin() async{
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('В О С С Т А Н О В Л Е Н И Е'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2 - 250),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Color.fromRGBO(54, 84, 140, 0.9),
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                Column(
                  children: const [
                    Text(
                      'Для восстановления пароля',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 84, 140, 0.9),
                      ),
                    ),
                    Text(
                      'введите логин, используемый',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 84, 140, 0.9),
                      ),
                    ),
                    Text(
                        'для входа',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 84, 140, 0.9),
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
                      hintText: 'Логин',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                  onPressed: CheckingLogin,
                  child: const Text(
                    'Отправить',
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