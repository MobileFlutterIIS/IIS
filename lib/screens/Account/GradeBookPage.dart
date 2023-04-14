import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/GradeBook.dart';
import 'package:iis/screens/Account/AccountPage.dart';

class GradeBookPage extends StatelessWidget{
  final List<GradeBook> gradebook;
  const GradeBookPage({Key? key, required this.gradebook}) : super(key: key);

  List<GradeBook> _sortGradeBookByDate(List<GradeBook> gradebook){
    gradebook.sort((a, b) =>
        a.student!.lessons![0].dateString!.compareTo(b.student!.lessons![0].dateString!));
    return gradebook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[200],
        centerTitle: true,
        title: Text('Р Е Й Т И Н Г'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              gradebook[0].student!.fio!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color.fromRGBO(51, 40, 32, 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}