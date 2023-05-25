import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/AccountManager.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';

class MainPage extends StatefulWidget {
  final UserEntity user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          // iconTheme: const IconThemeData(
          //   color: Colors.black, // Цвет иконки
          // ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.logout,
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    AccountManager.removeCredentials();
                    Navigator.pop(context);
                  });
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.11194,
                            width: MediaQuery.of(context).size.width*0.2385,
                            // decoration: BoxDecoration(
                            //   shape: BoxShape.circle,
                            //   border: Border.all(
                            //     color: Colors.white,
                            //     width: 8,
                            //   ),
                            // ),
                            child: ClipOval(
                              ///
                              /// TODO
                              /// CANT UPLOAD WHEN NO PHOTO
                              ///
                              child: UserIcon(url :widget.user.photoUrl!),
                              clipBehavior: Clip.antiAlias,
                            ),),
                          const SizedBox(height: 10),
                          Text(
                            widget.user.lastName! + ' ' + widget.user.firstName! + ' ' + widget.user.middleName!,
                            style: const TextStyle(
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Студент " + widget.user.course!.toString() + " курса",
                            style: const TextStyle(
                              fontFamily: 'NotoSerif',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Text(
                            'Факультет ' + widget.user.faculty! + ', ' + widget.user.speciality!,
                            style: const TextStyle(
                              fontFamily: 'NotoSerif',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 7,),
                          Text(
                            widget.user.birthDate!,
                            style: const TextStyle(
                              fontFamily: 'NotoSerif',
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 13,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/4 + 32),
                              widget.user.rating! >= 1
                                  ?const Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Color.fromRGBO(255, 180, 0, 0.9),
                              )
                                  :Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(width: 10),
                              widget.user.rating! >= 2
                                  ?const Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Color.fromRGBO(255, 180, 0, 0.9),
                              )
                                  :Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(width: 10),
                              widget.user.rating! >= 3
                                  ?const Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Color.fromRGBO(255, 180, 0, 0.9),
                              )
                                  :Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(width: 10),
                              widget.user.rating! >= 4
                                  ?const Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Color.fromRGBO(255, 180, 0, 0.9),
                              )
                                  :Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Colors.grey[350],
                              ),
                              const SizedBox(width: 10),
                              widget.user.rating! >= 5
                                  ?const Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Color.fromRGBO(255, 180, 0, 0.9),
                              )
                                  :Icon(
                                Icons.filter_vintage,
                                size: 20,
                                color: Colors.grey[350],
                              ),
                            ],
                          ),

                          const SizedBox(height: 50,),
                          widget.user.officeEmail!=null?
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/10),
                              const Text(
                                'Почта:  ',
                                style: TextStyle(
                                  // color: Colors.black,
                                  fontFamily: 'NotoSerif',
                                  fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                widget.user.officeEmail!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoSerif',
                                ),
                              ),
                            ],
                          ) :
                         const  Text(
                            'Почта:  ',
                            style: TextStyle(
                              // color: Colors.black,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 10,),
                          widget.user.officePassword!=null?
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/10),
                              const Text(
                                'Пароль:  ',
                                style: TextStyle(
                                  // color: Colors.black,
                                  fontFamily: 'NotoSerif',
                                  fontWeight: FontWeight.bold,
                                    fontSize: 16

                                ),
                              ),
                              Text(
                                widget.user.officePassword!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoSerif',
                                ),
                              ),
                            ],
                          ):
                          const Text(
                            'Пароль:  ',
                            style: TextStyle(
                              // color: Colors.black,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                      ],
                    ),
                    ),],
                      ),
                    ),
                  ],
                ),
        ),
      );

    }
}

  class UserIcon extends StatefulWidget {
  String url ;
  UserIcon({Key? key, required this.url}) : super(key: key);

    @override
    State<UserIcon> createState() => _UserIconState();
  }

  class _UserIconState extends State<UserIcon> {


    @override
    Widget build(BuildContext context) {
        return IconButton(
          icon: (widget.url != null
            ? Image.network(
              widget.url,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              alignment: Alignment.center)
            : Icon(Icons.person)) ,

          onPressed: () async{
            final ans = await AccountManager.SetUserImage();
            logger.d(ans);
            if (ans != null)
            setState(() {
              widget.url = ans;
            });
          },
        );
      }
  }



 ///
/// старая иконка которую делал не я


// (user.photoUrl != null
// ? Image.network(
// user.photoUrl!,
// width: 150,
// height: 150,
// fit: BoxFit.cover,
// )
//     : Icon( //-----------------------ИСПРАВИТЬ--(выглядит фу)
// Icons.person,
// size: 100,
// color: Colors.grey,
// ),
// ),

///
///

// class CustomShape extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     double height = size.height;
//     double width = size.width;
//     path.lineTo(0, height - 100);
//     path.quadraticBezierTo(width/2, height, width, height - 100);
//     path.lineTo(width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }


