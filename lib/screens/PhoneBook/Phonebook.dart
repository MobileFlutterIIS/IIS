import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:logger/logger.dart';
import 'package:iis/screens/Departments/DepartmenList.dart';

final logger = Logger();

class Phonebook extends StatefulWidget {
  Phonebook({
    super.key,
  });

  @override
  State<Phonebook> createState() => _PhonebookState();
}

class _PhonebookState extends State<Phonebook> {
  final controller = ScrollController();
  final controller2 = TextEditingController();
  String CurText = "э";
  double cardheight = 200;
  int max = 0;
  int page = 1;
  List<PhoneDto> Visiblephones = [];

  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        adddata();
      }
    });
    page = 1;
    super.initState();
  }

  Future adddata() async {
    final userspage =
        await DepartmentsManager.GetPhonePage(page + 1, 10, CurText);
    setState(() {
      Visiblephones.addAll(userspage!.auditoryPhoneNumberDtoList!);
      //logger.d(Visibleusers);
      page += 1;
    });
  }

  Future<bool> initialise() async {
    if (Visiblephones.isEmpty) {
      final userspage =
          await DepartmentsManager.GetPhonePage(page, 10, CurText);
      logger.d(CurText);
      max = userspage!.totalItems!;
      Visiblephones.addAll(userspage!.auditoryPhoneNumberDtoList!);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Телефонный справочник',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  textTheme: const TextTheme(
                    // Customize the text style for the input text
                    titleMedium: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSerif',
                    ),
                  ),
                ),
                child: TextField(
                  controller: controller2,
                  onChanged: (value) {
                    setState(() {
                      CurText = value;
                      Visiblephones.clear();
                      page = 1;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Поиск',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: initialise(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData && snapshot != null) {
                    return const CircularProgressIndicator();
                  }
                  if (Visiblephones.isEmpty) {
                    return const Icon(Icons.accessible_sharp);
                  }
                  return Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: Visiblephones.length + 1,
                        itemBuilder: (context, index) {
                          if (index < Visiblephones.length) {
                            return Container(
                                height: cardheight,
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column
                                    (
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      buildphones(Visiblephones[index].phones!),
                                      Divider(),
                                      Text('${Visiblephones[index].auditory!}, ${Visiblephones[index].buildingAddress!}'),
                                      buildDepartments(Visiblephones[index].departments!),
                                      Text(Visiblephones[index].departments!.last.name!,textAlign: TextAlign.center,),
                                      TextButton(onPressed: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DepartmentList(department: Visiblephones[index].employees!,place: "NOOPEN"),
                                            ));
                                      }, child: Text("Посмотреть Состав")),
                                      Text(Visiblephones[index].note!= null ? Visiblephones[index].note! : ''),
                                    ],
                                  )
                                )));
                          } else {
                            if (index == max){
                              return const Icon(Icons.ice_skating);}
                            if (Visiblephones.length <=
                                MediaQuery.of(context).size.height /
                                    cardheight) {
                              adddata();
                            }
                            return const CircularProgressIndicator();
                          }
                        }),
                  );
                }),
          ],
        ),
      ));
}

Text buildphones(List<String> phones)
{
  String res = phones[0];
  for (int i = 1; i < phones.length;i++)
    res+= '\n' + phones[i];
  return Text(res,style: TextStyle(fontSize: 20),);
}

Text buildDepartments(List<Department> dep)
{
  String res = dep[0].abbrev!;
  for (int i = 1; i < dep.length;i++)
    res+= ' / ' + dep[i].abbrev!;
  return Text(res,);
}