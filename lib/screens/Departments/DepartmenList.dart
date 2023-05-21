import 'package:flutter/material.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';

class DepartmentList extends StatelessWidget {
  final List<Post> department;
  const DepartmentList({Key? key, required List<Post> this.department }) : super(key: key);

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
                      Text(
                        department[index].firstName! + ' ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSerif',
                        ),
                      ),
                      Text(
                        department[index].middleName! + ' ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSerif',
                        ),
                      ),
                      Text(
                        department[index].lastName!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSerif',
                        ),
                      ),
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
