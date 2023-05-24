import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DepartmentList extends StatelessWidget {
  final List<Employee> department;
  final String place;
  const DepartmentList({Key? key, required List<Employee> this.department,required this.place }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Подразделения',
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
          child: ListView.builder(
            itemCount:department.length ,
              itemBuilder: (context,index)
              {
                return GestureDetector(
                  onTap: (){
                    if (place != "NOOPEN")
                    showDialog(context: context, builder: (BuildContext context) => createdialog (department[index]));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child:
                        CachedNetworkImage(
                          width: 80, height: 80,
                          imageUrl: department[index].photoLink !,
                          placeholder: (context, url) => Image.asset('images/pepo.png', width: 80, height: 80),
                          errorWidget: (context, url, error) => Image.asset('images/pepo.png', width: 80, height: 80),
                        ),
                        ),
                        Container(
                          width: 250,
                          child: Column(children: [
                            Text(department[index].fio != null? '${department[index].fio!}' : '${department[index].firstName!} ${department[index].middleName!} ${department[index].lastName!}' ,
                              style: TextStyle(fontSize: 20),),
                            Text((department[index].jobPositions != null? getPlace(department[index]) : department[index].jobPosition!),style: TextStyle(fontSize: 10),),
                          ],),
                        )
                       // Text(department[index].rank!),
                      ],
                    ),
                  ),
                );
              }
          ),
      ),
    );
  }

  String getPlace(Employee emp)
  {
    List<Job>? jobs = emp.jobPositions;
    if(jobs == null || jobs.isEmpty) return '';
    else
      {
        String res = jobs[0].jobPosition!;
        jobs!.forEach((element) {
          if (element.department! == place) {res = element.jobPosition!; return;}
        });
        return res;
      }
  }

}

///
/// TODO
/// THIS SHIT IS SUCKS
///

AlertDialog createdialog (Employee post)
{
  return AlertDialog(
    //backgroundColor: Colors.grey[900],
    scrollable: true,
    title: post.firstName!= null ? Text('${post.firstName!} ${post.middleName!} ${post.lastName!}') : Text('${post.fio!}'),
    content:
           Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ученая степень'),
                Text((post.degree != null ? '${post.degree!}' : '') + (post.rank!= null ? '${post.rank!}': '')),
                Text('Должность, место работы'),
                SizedBox(
                  height:  post.jobPositions!.length*50,
                  width: double.maxFinite,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: post.jobPositions!.length,
                      itemBuilder: (context,index){
                        return SizedBox(
                          child: Row(children: [
                            Icon(Icons.circle),
                            Container(width: 200,child: Text('${post.jobPositions![index].jobPosition!},${post.jobPositions![index].department!}')),
                          ],),
                        );
                      } ),
                ),
                Divider(),
                Text('Контакты'),
                Text('Почта ${post.email!}'),
                Text('Рабочий телефон:'),
                
              ],
      ),
    ),
  );
}
