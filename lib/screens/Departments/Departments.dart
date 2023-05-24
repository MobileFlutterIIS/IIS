import 'package:flutter/material.dart';
import 'package:iis/services/DepartmentsApi/DepartmentsManager.dart';
import 'package:iis/services/DepartmentsApi/departmentsapi.dart';
import 'package:iis/screens/Departments/DepartmenList.dart';
import 'package:iis/services/ScheduleAndListFromNet/Api.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Departments extends StatelessWidget {
  Departments({
    super.key,
  });

  Future<List<DepartmentContainer>?> initialise() async {
    final Departments = await DepartmentsManager.GetDepartments();
    return Departments;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
          child: FutureBuilder(
              future: initialise(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DepartmentContainer>?> snapshot) {
                if (!snapshot.hasData || snapshot == null)
                  return const CircularProgressIndicator();
                final list = snapshot.data!;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      if (list[index] != null && list[index].data!.code != null)
                        return Card(child: Expacard(temp: list[index]));
                    });
              }),
        ),
      );
}

class Expacard extends StatelessWidget {
  final DepartmentContainer? temp;

  Expacard({Key? key, required this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return temp!.children != null
        ? ExpansionTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              temp!.data!.numberOfEmployee! != 0
                  ? Container(
                      height: 25,
                      width: 50,
                      child: ElevatedButton(
                        child: Text(
                          temp!.data!.numberOfEmployee!.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                        onPressed: () async {
                          List<Employee>? templist =
                              await DepartmentsManager.GetTutorsDepartment(
                                  temp!.data!.id!);
                          logger.d(templist);
                          if (templist != null)
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DepartmentList(department: templist,place: temp!.data!.name!),
                              ),
                            );

                          ///
                          ///  TODO
                          ///  ADD ERROR MESSAGE
                          ///
                        },
                      ),
                    )
                  : Container(
                      height: 25,
                      width: 50,
                      child: ElevatedButton(
                        child: Text(
                          temp!.data!.numberOfEmployee!.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                        onPressed: () async {},
                      ),
                    ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 200,
                  child: Text(
                    '${temp!.data!.code!} ${temp!.data!.name!}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSerif',
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.clip,
                  )),
            ]),
            children: List.generate(
              temp!.children!.length,
              (index2) => Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Expacard(temp: temp!.children![index2]),
              ),
            ),
          )
        : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              width: 14,
            ),
            temp!.data!.numberOfEmployee! != 0
                ? Container(
                    height: 25,
                    width: 50,
                    child: ElevatedButton(
                      child: Text(
                        temp!.data!.numberOfEmployee!.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      onPressed: () async {
                        List<Employee>? templist =
                            await DepartmentsManager.GetTutorsDepartment(
                                temp!.data!.id!);
                        logger.d(templist);
                        if (templist != null)
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DepartmentList(department: templist,place: temp!.data!.name!,),
                            ),
                          );

                        ///
                        ///  TODO
                        ///  ADD ERROR MESSAGE
                        ///
                      },
                    ),
                  )
                : Container(),
            const SizedBox(
              width: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 210,
                child: Text(
                  '${temp!.data!.code!} ${temp!.data!.name!}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSerif',
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.fade,
                )),
          ]);
  }
}
