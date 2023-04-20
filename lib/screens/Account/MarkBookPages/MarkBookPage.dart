import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/MarkBook.dart';

class MarkBookPage extends StatefulWidget {
  final Markbook markBook;

  const MarkBookPage({Key? key, required this.markBook}) : super(key: key);

  @override
  State<MarkBookPage> createState() => _MarkBookPageState();
}

class _MarkBookPageState extends State<MarkBookPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.brown[200],
          centerTitle: true,
          title: Text('З А Ч Е Т К А'),
        ),
        body: Column(
          children: [
            TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.looks_one,
                      color: Color.fromRGBO(51, 40, 32, 0.9),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.looks_two,
                      color: Color.fromRGBO(51, 40, 32, 0.9),
                    ),
                  ),
                ],
            ),
            const SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Text(
            //       'Общий средний балл: ',
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //     Text(
            //       markBook.averageMark != null
            //           ?markBook.averageMark!.toString()
            //           :'0',
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 30,),
            Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: buildListView(widget.markBook.markPages![1]!),
                    ),
                    Container(
                      // child: ListView.builder(
                      //   itemCount: 0,
                      //   itemBuilder: (context, index)
                      //     {
                      //       return Container(
                      //
                      //       );
                      //     }
                      // ),
                    ),
                  ],

                ),
            ),

          ],
        ),
      ),
    );
  }

  ListView buildListView(Simestre simestre ) {
    return ListView.builder(
                      itemCount: simestre.marks!.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index)
                      {
                        return Container(
                          height: 100,
                          child: Card(
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Text(
                                    //   markBook.additionalProp1!.marks![index].fullSubject!=null
                                    //   ? markBook.additionalProp1!.marks![index].fullSubject!
                                    //   : "",
                                    // ),
                                    Text(
                                      ' (',
                                    ),
                                    // Text(
                                    //     markBook.additionalProp1!.marks![index].hours != null
                                    //         ?markBook.additionalProp1!.marks![index].hours!
                                    //         : ""
                                    // ),
                                    Text(
                                      ', ',
                                    ),
                                    // Text(
                                    //     markBook.additionalProp1!.marks![index].formOfControl != null
                                    //         ? markBook.additionalProp1!.marks![index].formOfControl!
                                    //         :"",
                                    // ),
                                    Text(
                                      ')',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Пересдачи'
                                ),
                                // Text(
                                //   markBook.additionalProp1!.marks![index].retakesCount != null
                                //   ? markBook.additionalProp1!.marks![index].retakesCount!.toString()
                                //   : '0',
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
  }
}