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
        iconTheme: const IconThemeData(
          color: Colors.black, // Цвет иконки
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Информация о справках',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color.fromRGBO(51, 40, 32, 0.9),
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
                          height: 300,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 24,),
                                  Text(
                                    'Тип документа',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(51, 40, 32, 0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    sortedOmissions[index].name!,
                                  ),
                                  const SizedBox(height: 20,),
                                  Text(
                                    'Дата начала действия',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(51, 40, 32, 0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    sortedOmissions[index].dateFrom!.toString()
                                        + ', ' +sortedOmissions[index].term! + 'семестр',
                                  ),
                                  const SizedBox(height: 20,),
                                  Text(
                                    'Дата окончания действия',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(51, 40, 32, 0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    sortedOmissions[index].dateTo!.toString()
                                        + ', ' +sortedOmissions[index].term! + 'семестр',
                                  ),
                                  const SizedBox(height: 20,),
                                  sortedOmissions[index].note != null
                                  ? Text(
                                    'Примечание',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(51, 40, 32, 0.9),
                                    ),
                                  )
                                  : Text(''),
                                  const SizedBox(height: 8,),
                                  sortedOmissions[index].note != null
                                  ? Text(
                                    sortedOmissions[index].note!,
                                  )
                                      : Text(''),
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