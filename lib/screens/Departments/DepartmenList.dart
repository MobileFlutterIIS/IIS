import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

class DepartmentList extends StatelessWidget {
  final List<Post> department;
  const DepartmentList({Key? key, required List<Post> this.department }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
            itemCount:department.length ,
              itemBuilder: (context,index)
              {
                return Card(
                  child: Row(
                    children: [
                      ClipRRect(child:
                          ///
                      ///  NETWORIMAGE может быть пустой, заменить на другой метод
                      ///
                      department[index].photoLink != null ? Image(image: NetworkImage(department[index].photoLink !),height:80 ,width: 80,) :
                      Image.asset('images/pepo.png'),
                      ),
                      Text(department[index].firstName!),
                      Text(department[index].middleName!),
                      Text(department[index].lastName!),
                     // Text(department[index].rank!),
                    ],
                  ),
                );
              }
          ),
      ),
    );
  }
}
