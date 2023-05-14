import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/screens/Departments/DepartmenList.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Departments extends StatelessWidget{

  Departments({
    super.key,
  });

  Future<List<DepartmentContainer>?> initialise() async
  {
    final Departments = await DepartmentsManager.GetDepartments();
    return Departments;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    //backgroundColor: backgroundcolor,
    body: Scaffold(
      //backgroundColor: backgroundcolor,
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
                      //color: backgroundcolor,
                      child: Expacard (temp: list[index])
                  );
                }
            );
          }
        ),
      ),
    )
  );


}

class Expacard extends StatelessWidget {
  final DepartmentContainer? temp;
  Expacard({Key? key, required this.temp }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return temp!.children!= null? ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            temp!.data!.numberOfEmployee! != 0 ? Container(
              height: 25,
              width: 40,
              child: ElevatedButton(
                child: Text(temp!.data!.numberOfEmployee!.toString(),style: TextStyle(color: Colors.white,fontSize: 10),),
                onPressed: () async{
                  List<Post>? templist = await DepartmentsManager.GetTutorsDepartment(temp!.data!.id!);
                  logger.d(templist);
                  if (templist != null)
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DepartmentList(department: templist!),),);
                  ///
                  ///  TODO
                  ///  ADD ERROR MESSAGE
                  ///
                },
              ),
            ) : Container(),
            Container(width: MediaQuery.of(context).size.width-200, child: Text('${temp!.data!.code!}${temp!.data!.name!}', style: TextStyle(color: Colors.black54), overflow: TextOverflow.clip,)),
          ]
      ),
      children: List.generate(temp!.children!.length, (index2) =>
             Padding(
               padding: const EdgeInsets.only(left: 25),
               child: Expacard(temp :temp!.children![index2]),
             ),
      ),
    ):
    Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            temp!.data!.numberOfEmployee! !=0 ? Container(
              height: 25,
              width: 40,
              child: ElevatedButton(
                child: Text(temp!.data!.numberOfEmployee!.toString(),style: TextStyle(color: Colors.white,fontSize: 10),),
                onPressed: () async{
                  List<Post>? templist = await DepartmentsManager.GetTutorsDepartment(temp!.data!.id!);
                  logger.d(templist);
                  if (templist != null)
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DepartmentList(department: templist!),),);
                  ///
                  ///  TODO
                  ///  ADD ERROR MESSAGE
                  ///
                },
              ),
            ) : Container(),
            Container(width: MediaQuery.of(context).size.width-200, child: Text('${temp!.data!.code!}${temp!.data!.name!}',
              style: TextStyle(color: Colors.black),overflow: TextOverflow.fade,)),
          ]
      ),
    );
  }
}

