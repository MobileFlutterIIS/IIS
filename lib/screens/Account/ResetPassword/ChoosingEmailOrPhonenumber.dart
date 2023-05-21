import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/ContactsToReset.dart';
import 'package:iis/screens/Account/ResetPassword/Exist.dart';

class ChoosingEmailOrPhonenumber extends StatefulWidget{
  final ContactsToReset contactsToReset;
  final String login;
  const ChoosingEmailOrPhonenumber({super.key, required this.contactsToReset, required this.login});

  @override
  State<ChoosingEmailOrPhonenumber> createState() => _ChoosingEmailOrPhonenumberState();
}

class _ChoosingEmailOrPhonenumberState extends State<ChoosingEmailOrPhonenumber> {

  void setVariantOfReset(String variant, String login){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Exist(contactValue: variant, login: login),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final contacts = widget.contactsToReset;
    final login = widget.login;
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
              'Способ восстановления',
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
                      'Выберите способ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    Text(
                      'восстановления',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                contacts.contacts!.length==2?
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setVariantOfReset(contacts.contacts![0].contactValue!, login);
                        },
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 5,),
                                Text(
                                  contacts.contacts![0].contactValue!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'NotoSerif',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setVariantOfReset(contacts.contacts![1].contactValue!, login);
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 5,),
                                  Text(
                                    contacts.contacts![1].contactValue!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'NotoSerif',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                )
                    :
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setVariantOfReset(contacts.contacts![0].contactValue!, login);
                      },
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 5,),
                              Text(
                                contacts.contacts![0].contactValue!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'NotoSerif',
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}