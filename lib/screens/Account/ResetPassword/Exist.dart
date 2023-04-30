import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:iis/screens/Account/ResetPassword/SetNewPassword.dart';

class Exist extends StatefulWidget{
  final String contactValue;
  final String login;
  const Exist({super.key, required this.contactValue, required this.login});

  @override
  State<Exist> createState() => _ExistState();
}

class _ExistState extends State<Exist> {
  final controller = TextEditingController();
  ContactsToReset? contact;

  void checkingEnter(String contactVal, String login) async{
    print(controller.text);
    String contactValue = "";
    for(int i=0; i<contactVal.length; i++){
      if(contactVal[i]=='*'){
        while(contactVal[i]=='*'){
          i++;
        }
        contactValue+=controller.text;
      }
      contactValue+=contactVal[i];
    }
    contact = await AccountManager.PhoneNumberToResetPassword(contactValue, login);
    if(contact!=null){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SetNewPassword(contactValue: contactValue, login: login,)
      ));
    }
    else{
      print("wrongMatch");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('П О Д Т В Е Р Ж Д Е Н И Е'),
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
                    Icons.key,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Введите недостающую часть',
                  style: TextStyle(
                    color: Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                ),
                const Text(
                  'для подтверждения',
                  style: TextStyle(
                    color: Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.contactValue,
                  style: const TextStyle(
                    color: Color.fromRGBO(20, 31, 51, 0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 240,
                  height: 40,
                  child: TextField(
                    controller: controller,
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
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  ),
                  onPressed: () {
                    checkingEnter(widget.contactValue, widget.login);
                  },
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