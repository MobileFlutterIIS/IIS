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
        //toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Подтверждение способа',
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
                const Text(
                  'Введите недостающую часть',
                  style: TextStyle(
                    //color: Colors.black,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                const Text(
                  'для подтверждения',
                  style: TextStyle(
                    //color: Colors.black,
                    fontFamily: 'NotoSerif',
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.contactValue,
                  style: const TextStyle(
                    //color: Colors.black,
                    fontFamily: 'NotoSerif',
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
                    style: const TextStyle(
                      //color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Введите',
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
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: const Color.fromRGBO(54, 84, 140, 0.9),
                  // ),
                  onPressed: () {
                    checkingEnter(widget.contactValue, widget.login);
                  },
                  child: const Text(
                    'Отправить',
                    style: TextStyle(
                      //color: Colors.white,
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