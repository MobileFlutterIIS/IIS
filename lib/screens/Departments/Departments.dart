import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';


class Departments extends StatelessWidget{

  Future<List<DepartmentContainer>?> initialise() async
  {
    final Departments = await DepartmentsManager.GetDepartments();
    return Departments;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: initialise(),
          builder: (BuildContext context, AsyncSnapshot<List<DepartmentContainer>?> snapshot)
          {
            if(!snapshot.hasData || snapshot == null) return CircularProgressIndicator();
            final list = snapshot.data!;
            return ListView.builder(
                itemCount: list.length ,
                itemBuilder: (context,index)
                {
                  if (list[index] != null && list[index]!.data!.code != null)
                  return Card(
                    child: Text('${list[index]!.data!.code!}${list[index]!.data!.name!}'),
                  );
                }
            );
          }
        ),
      ),
    )
  );
}