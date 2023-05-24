import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';



class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  ///
  /// Тут пока заглушка только с дизайном,
  /// TODO
  /// 1) непосредственно запрос
  /// 2) автозаполнение если залогинен
  ///


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Поддержка',
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
      body: Column(
        children:
        [
          TabBar(
              isScrollable: true,
              labelStyle: const TextStyle(fontSize: 24),
              unselectedLabelStyle: const TextStyle(fontSize: 20),
              tabs:
              [
                Text(
                  'Отправить жалобу',
                  style: const TextStyle(
                    color: Color.fromRGBO(22, 49, 99, 0.9),
                  ),
                ),Text(
                'Ссылки',
                style: const TextStyle(
                  color: Color.fromRGBO(22, 49, 99, 0.9),
                ),
              ),
              ]

          ),
          Expanded(
            child: TabBarView(children: [
              Container(child: MainSupport()),
              Container(child: Links()),
            ]),
          )
        ]
      ),
    ));
  }
}

// MainSupport()

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Система для организации выполнения заявок от структурных подразделений и пользователей:'),
        BuildHyperlink('Стандартный набор ПО','https://iis.bsuir.by/public_iis_files/softwareList.pdf',context),
        Text('Настройки компьютерной сети:'),
        BuildHyperlink('Руководство для настройки Wi-Fi','https://iis.bsuir.by/public_iis_files/wifiGuide.pdf',context),
        BuildHyperlink('Начало работы с Microsoft 365','https://iis.bsuir.by/public_iis_files/officeStartGuide.pdf',context),
        Text('Настройка почты университета:'),
        BuildHyperlink('Студенческая почта','https://iis.bsuir.by/public_iis_files/studentMail.pdf',context),
        Row(children: [
          Tooltip(message: 'Доступно только из локальной сети',child:
          Icon(Icons.warning_amber,color: Colors.red,)),
          Text('Политика безопасности БГУИР:'),],),
        BuildHyperlink('Политика безопасности университета','https://iis.bsuir.by/iis_files/privacyPolicy.pdf',context),
        BuildHyperlink('Список ответственных за соблюдение политики безопасности','https://iis.bsuir.by/iis_files/privacyPolicyList.pdf',context),
        BuildHyperlink('Инструкция по настройке ПК в структурных подразделениях','https://iis.bsuir.by/iis_files/pcSettings.pdf',context),
      ],
    ),);
  }

  Row BuildHyperlink(String text,String url,BuildContext context) {
    return Row(children: [
        Icon(Icons.arrow_forward_ios),
        Container(
          width: MediaQuery.of(context).size.width-60,
          alignment: Alignment.centerLeft,
          child: ElevatedButton(child: Text(text,softWrap: true,),
          onPressed: () async
            {
              //const url = 'https://iis.bsuir.by/public_iis_files/softwareList.pdf';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launch(url);
              }
              else {
                throw 'Could not launch $url';
              }
            },
          ),
        )
      ]
      );
  }
}



class MainSupport extends StatelessWidget {
  const MainSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "ФИО",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            decoration: const InputDecoration(
              labelText: "Почта",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            decoration: const InputDecoration(
              labelText: "Студенческий билет",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            decoration: const InputDecoration(
              labelText: "Группа",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            decoration: const InputDecoration(
              labelText: "Проблемма",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( width: 2,),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 5,),
          ElevatedButton(onPressed: (){}, child: Text('Отправить'))
        ],
      ),
    );
  }
}

//Center(child:
//Image.asset('images/pepo.png',scale: 0.05,),
//) ;
