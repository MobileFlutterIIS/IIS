import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Phonebook extends StatefulWidget{
  final Color backgroundcolor;
  final Color primarycolor;
  Phonebook({
    super.key,
    required this.backgroundcolor,
    required this.primarycolor
  });

  @override
  State<Phonebook> createState() => _PhonebookState();
}

class _PhonebookState extends State<Phonebook> {
  final controller = ScrollController();
  final controller2 = TextEditingController();
  String CurText = "э";
  double cardheight = 50;
  int max = 0;
  int page = 1;
  List<PhoneDto> Visiblephones =[];

  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset)
      {
        adddata();
      }
    });
    page = 1;
    super.initState();
  }

  Future adddata() async{
    final userspage = await DepartmentsManager.GetPhonePage(page+1,10,CurText);
    setState(() {
      Visiblephones.addAll(userspage!.auditoryPhoneNumberDtoList!);
      //logger.d(Visibleusers);
      page+=1;
    });
  }

  Future<bool> initialise() async
  {
    if (Visiblephones.isEmpty) {
      final userspage = await DepartmentsManager.GetPhonePage(
          page , 10, CurText);
      logger.d(CurText);
      max = userspage!.totalItems!;
      Visiblephones.addAll(userspage!.auditoryPhoneNumberDtoList!);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.backgroundcolor,
    body: SafeArea(
      child:
      Column(
        children: [
          TextField(
            controller: controller2,
            onChanged: (value) {
              setState(() {
                CurText = value;
                Visiblephones.clear();
                page = 1;
              });
            },
          ),
          FutureBuilder(
            future: initialise(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
              {
                if (!snapshot.hasData && snapshot != null)
                  return CircularProgressIndicator();
                if (Visiblephones.length == 0) return Icon(Icons.accessible_sharp);
                return Expanded(
                  child:
                  ListView.builder(
                    controller: controller,
                     itemCount: Visiblephones.length+1,
                      itemBuilder: (context,index){
                        if (index < Visiblephones.length)
                          return Container( height: cardheight, child: Card(child: Text(Visiblephones[index].auditory!)));
                        else
                          {
                            if (index == max) return Icon(Icons.ice_skating);
                            if (Visiblephones.length <= MediaQuery.of(context).size.height/cardheight);
                            adddata();
                            return CircularProgressIndicator();
                          }
                      }
                  ),
                );
              }
          ),
        ],
      ),
    )
  );
}