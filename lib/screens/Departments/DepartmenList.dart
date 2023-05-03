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
                  child: Column(
                    children: [
                      Text(department[index].firstName!)
                    ],
                  ),
                );
              }
          ),
      ),
    );
  }
}
