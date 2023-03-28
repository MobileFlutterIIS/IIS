import 'package:flutter/material.dart';
import 'package:iis/pages/schedulechoice/ScheduleSearch.dart';


class ChooseSchedule extends StatefulWidget {
  const ChooseSchedule({Key? key}) : super(key: key);

  @override
  State<ChooseSchedule> createState() => _MySchedule();
}



class _MySchedule extends State<ChooseSchedule> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Align(
        alignment: FractionalOffset(0.93,0.97),
        child: ElevatedButton(
          style: ButtonStyle(

            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
          child: Icon(Icons.add),
          onPressed: (){

          },
        ),
      ),
    ),
  );
}