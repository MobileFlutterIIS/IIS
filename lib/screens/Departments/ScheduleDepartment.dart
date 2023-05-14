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

final logger =Logger();

class ScheduleDepartment extends StatefulWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  ScheduleDepartment({
    super.key,
    required this.backgroundcolor,
    required this.primarycolor
  });

  @override
  State<ScheduleDepartment> createState() => _ScheduleDepartmentState();
}

class _ScheduleDepartmentState extends State<ScheduleDepartment> {
  static List<Department>? Departments  = null;
  static Department? ChosenDepartment;
  static Excel? excel;

  Future<bool> initialize() async
  {
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
    backgroundColor: widget.backgroundcolor,
    body: SafeArea(
      child: FutureBuilder(
        future: initialize(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData && snapshot != null)
            return CircularProgressIndicator();
          return Column(
          children: [
               DropdownButton<Department>(
                   isExpanded: true,
                   hint: Text(
                     'Department',
                     style: TextStyle(
                       color: widget.primarycolor,
                     ),
                   ),
                 value: ChosenDepartment,
                   items: Departments!.map<DropdownMenuItem<Department>>((
                       Department value) {
                     return DropdownMenuItem<Department>(
                       value: value,
                       child: Text(value.name!, overflow: TextOverflow.visible),
                     );
                   }).toList(),
                   onChanged: (Department? dep)
                   {
                     setState(() {
                       ChosenDepartment = dep;
                     });
                   }
               ),
            ElevatedButton(onPressed: () async {
              logger.d(ChosenDepartment!.id!);
                 Dio _dio = Dio();
                  Response response = await _dio.get(
                    "https://iis.bsuir.by/api/v1/departments/report?department-id=${ChosenDepartment!.id!}",
                    options: Options(
                        responseType: ResponseType.bytes,
                        followRedirects: false,
                        validateStatus: (status) { return status! < 500; }
                    ),
                  );
              var ex = Excel.decodeBytes(response.data!);
              logger.d(ex.tables.length);
              setState(() {
                excel = ex;
              });
            }, child: Icon(Icons.image_aspect_ratio_outlined)),
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: excel != null? Table(
                      border: TableBorder.all(color: Colors.green, width: 1.5),
                      defaultColumnWidth: FixedColumnWidth(100),
                      children:
                        List.generate(excel!.tables![excel!.tables!.keys.first]!.rows!.length!, (index) => TableRow(
                            children:
                            List.generate(excel!.tables![excel!.tables!.keys.first]!.rows![index]!.length, (twindex) =>
                            Text(excel!.tables![excel!.tables!.keys.first]!.rows![index]![twindex] == null?
                            '':
                            excel!.tables![excel!.tables!.keys.first]!.rows![index]![twindex]!.value.toString()
                            )
                            )
                         ),
                        ),
                    ):
                    Center(child: Icon(Icons.icecream_outlined),)
                  ),
                ),
              ),
          ],
        );
        }
      ),
    ),
  );
}