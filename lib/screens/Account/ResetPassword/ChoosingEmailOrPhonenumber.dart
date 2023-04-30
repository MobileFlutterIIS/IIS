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
        title: const Text('С П О С О Б'),
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

                Column(
                  children: const [
                    Text(
                      'Выберите способ',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 84, 140, 0.9),
                      ),
                    ),
                    Text(
                      'восстановления',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 84, 140, 0.9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                contacts.contacts!.length==2?
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setVariantOfReset(contacts.contacts![0].contactValue!, login);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.border_right,
                            size: 20,
                            color: Color.fromRGBO(54, 84, 140, 0.9),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            children: [
                              const SizedBox(height: 5,),
                              Text(
                                contacts.contacts![0].contactValue!,
                                style: const TextStyle(
                                  color: Color.fromRGBO(20, 31, 51, 0.9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setVariantOfReset(contacts.contacts![1].contactValue!, login);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.border_right,
                              size: 20,
                              color: Color.fromRGBO(54, 84, 140, 0.9),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              children: [
                                const SizedBox(height: 5,),
                                Text(
                                  contacts.contacts![1].contactValue!,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(20, 31, 51, 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                )
                    :
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setVariantOfReset(contacts.contacts![0].contactValue!, login);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.border_right,
                          size: 20,
                          color: Color.fromRGBO(54, 84, 140, 0.9),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          children: [
                            const SizedBox(height: 5,),
                            Text(
                              contacts.contacts![0].contactValue!,
                              style: const TextStyle(
                                color: Color.fromRGBO(20, 31, 51, 0.9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}