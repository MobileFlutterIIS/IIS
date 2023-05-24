import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/screens/Departments/DepartmenList.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:excel/excel.dart';
import 'package:flutter_parse/flutter_parse.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iis/services/InternetInfoAndFetch.dart';

final logger = Logger();

class ScheduleDepartment extends StatefulWidget {
  ScheduleDepartment({
    super.key,
  });

  @override
  State<ScheduleDepartment> createState() => _ScheduleDepartmentState();
}

class _ScheduleDepartmentState extends State<ScheduleDepartment> {
  static List<Department>? Departments = null;
  static List<DepartmentAnnouncement>? Anouncements = null;
  static Department? ChosenDepartment;
  //static Excel? excel;

  Future<bool> initialize() async {
    if (Departments == null || Departments!.isEmpty)
      Departments = await DepartmentsManager.GetDepartmentsNonTree();
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: const [
              Text(
                'Расписание кафедры',
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
        body: SafeArea(
          child: FutureBuilder(
              future: initialize(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData && snapshot != null){
                  return const CircularProgressIndicator();}
                if (InternetInfo.hasconnect == false){
                  return const Center(child: Icon(Icons.warning),);}
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButton<Department>(
                        isExpanded: true,
                        hint: const Text(
                          'Подразделение',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        value: ChosenDepartment,
                        items: Departments != null? Departments!.map<DropdownMenuItem<Department>>(
                            (Department value) {
                          return DropdownMenuItem<Department>(
                            value: value,
                            child: Center(
                              child: Text(value.abbrev!,
                                  overflow: TextOverflow.visible,
                              ),
                            ),
                          );
                        }).toList(): null,
                        onChanged: (Department? dep)async  {
                         final as =  await await DepartmentsManager.GetDepartmentAnouncements(dep!.id!);
                          setState(()  {
                            ChosenDepartment = dep;
                            Anouncements = as;
                            logger.d(Anouncements);
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Скачать расписание подразделения:",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                    ),
                    Text(
                      "${ChosenDepartment != null? ChosenDepartment!.name!: "Не выбрано"}",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSerif',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          // logger.d(ChosenDepartment!.id!);
                          // Dio _dio = Dio();
                          // Response response = await _dio.get(
                          //   "https://iis.bsuir.by/api/v1/departments/report?department-id=${ChosenDepartment!.id!}",
                          //   options: Options(
                          //       responseType: ResponseType.bytes,
                          //       followRedirects: false,
                          //       validateStatus: (status) {
                          //         return status! < 500;
                          //       }),
                          // );
                          // var ex = Excel.decodeBytes(response.data!);
                          // logger.d(ex.tables.length);
                          // setState(() {
                          //   excel = ex;
                          // });
                          final url = "https://iis.bsuir.by/api/v1/departments/report?department-id=${ChosenDepartment!.id!}";
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launch(url);
                          }
                          else {
                            throw 'Could not launch $url';
                          }

                        },
                        child: const Icon(Icons.image_aspect_ratio_outlined)),
                    Text('Объявления'),
                    Expanded(child:
                (Anouncements != null && Anouncements!.isNotEmpty)?
                    ListView.builder(
                      itemCount: Anouncements!.length,
                        itemBuilder: (contxt, index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 3,
                          shape:  const RoundedRectangleBorder(
                        side: BorderSide(
                        color: Colors.black12,
                        ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ///
                                  /// TODO not all info
                                  ///
                                  Text(Anouncements![index].date!,style: TextStyle(fontSize: 20),),
                                  Text('${Anouncements![index].startTime!} - ${Anouncements![index].endTime!} '),
                                  Divider(),
                                  Text(Anouncements![index].content!,style: TextStyle(fontSize: 17), softWrap: true, textAlign: TextAlign.center, ),
                                  Divider(),
                                  Text(Anouncements![index].employee!,style: TextStyle(fontSize: 17)),
                                  groups(Anouncements![index].studentGroups!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }): Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Нет объявлений'),
                        Icon(Icons.filter_list_off_outlined,),
                      ],
                    ),
                    )

                    ///
                    /// ВЬюшка для эксельки, дико лагает, пока ее не будет
                    ///
                    // Expanded(
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: SingleChildScrollView(
                    //         scrollDirection: Axis.vertical,
                    //         child: excel != null
                    //             ? Table(
                    //                 border: TableBorder.all(
                    //                     color: Colors.green, width: 1.5),
                    //                 defaultColumnWidth: const FixedColumnWidth(100),
                    //                 children: List.generate(
                    //                   excel!.tables[excel!.tables.keys.first]!
                    //                       .rows.length,
                    //                   (index) => TableRow(
                    //                       children: List.generate(
                    //                           excel!
                    //                               .tables[
                    //                                   excel!.tables.keys.first]!
                    //                               .rows[index]
                    //                               .length,
                    //                           (twindex) => Text(
                    //                               excel!
                    //                                               .tables[excel!
                    //                                                   .tables
                    //                                                   .keys
                    //                                                   .first]!
                    //                                               .rows[index]
                    //                                           [twindex] ==
                    //                                       null
                    //                                   ? ''
                    //                                   : excel!
                    //                                       .tables[excel!.tables
                    //                                           .keys.first]!
                    //                                       .rows[index][twindex]!
                    //                                       .value
                    //                                       .toString()))),
                    //                 ),
                    //               )
                    //             : const Center(
                    //                 child: Icon(Icons.icecream_outlined),
                    //               )),
                    //   ),
                    // ),
                  ],
                );
              }),
        ),
      );
}

Text groups (List<GroupInf> group)
{
  String sample = '';
  group.forEach((element) {sample += element.name!+ ' ';});
  return Text(sample);
}