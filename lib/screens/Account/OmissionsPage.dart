import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/Omissions.dart';

class OmissionsPage extends StatelessWidget{
  final List<Omission> omissions;
  const OmissionsPage({Key? key, required this.omissions}) : super(key: key);

  List<Omission> _sortOmissionsByTerm(List<Omission> omissions) {
    omissions.sort((a, b) => a.term!.compareTo(b.term!));
    return omissions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Пропуски',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSerif',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        // iconTheme: const IconThemeData(
        //   color: Colors.black, // Цвет иконки
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          const Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Информация о справках',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'NotoSerif',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40,),
          Expanded(
            child: SafeArea(
              child: Container(
                child: ListView.builder(
                  itemCount: omissions.length,
                  itemBuilder: (context, index)
                      {
                        final sortedOmissions = _sortOmissionsByTerm(omissions);
                        return Container(
                          height: MediaQuery.of(context).size.height*0.2861,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24,),
                                  const Text(
                                    'Тип документа',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'NotoSerif',
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    sortedOmissions[index].name!,
                                    style: TextStyle(fontFamily: 'NotoSerif',),
                                  ),
                                  const SizedBox(height: 20,),
                                  const Text(
                                    'Время действия',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'NotoSerif',
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    sortedOmissions[index].term! + ' семестр',
                                    style: TextStyle(fontFamily: 'NotoSerif',),
                                  ),
                                  const SizedBox(height: 20,),
                                  sortedOmissions[index].note != null
                                  ? const Text(
                                    'Примечание',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'NotoSerif',
                                    ),
                                  )
                                  : const Text(''),
                                  const SizedBox(height: 8,),
                                  sortedOmissions[index].note != null
                                  ? Text(
                                    sortedOmissions[index].note!,
                                    style: TextStyle(fontFamily: 'NotoSerif',),
                                  )
                                      : const Text(''),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}