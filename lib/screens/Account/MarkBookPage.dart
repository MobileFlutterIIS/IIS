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
    final markBook = widget.markBook;
    return DefaultTabController(
      length: markBook.markPages!.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
          leadingWidth: MediaQuery.of(context).size.width * 0.046,
          title: Row(
            children: const [
              Text(
                'Зачетка',
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
            TabBar(
              isScrollable: true,
              tabs: List.generate(widget.markBook.markPages!.length, (index) {
                return Tab(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Color.fromRGBO(22, 49, 99, 0.9),
                      fontSize: 18.0,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: TabBarView(
                    children: [
                      widget.markBook.markPages!.length>=1
                          ?Container(
                            child: buildListView(widget.markBook.markPages![1]!),
                          )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=2
                          ?Container(
                            child: buildListView(widget.markBook.markPages![2]!),
                          )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=3
                          ?Container(
                        child: buildListView(widget.markBook.markPages![3]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=4
                          ?Container(
                        child: buildListView(widget.markBook.markPages![4]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=5
                          ?Container(
                        child: buildListView(widget.markBook.markPages![5]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=6
                          ?Container(
                        child: buildListView(widget.markBook.markPages![6]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=7
                          ?Container(
                        child: buildListView(widget.markBook.markPages![7]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=8
                          ?Container(
                        child: buildListView(widget.markBook.markPages![8]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=9
                          ?Container(
                        child: buildListView(widget.markBook.markPages![9]!),
                      )
                          :Text('Экзамены пока не известны'),
                      widget.markBook.markPages!.length>=10
                          ?Container(
                        child: buildListView(widget.markBook.markPages![10]!),
                      )
                          :Text('Экзамены пока не известны'),
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
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  title: Text(
                                    simestre.marks![index].fullSubject!,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(22, 49, 99, 0.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 20,),
                                      Text(
                                        simestre.marks![index].teacher!=null
                                            ?simestre.marks![index].teacher!=''
                                            ?simestre.marks![index].teacher!
                                            :'Преподаватель пока не известен'
                                            :'Преподаватель пока не известен',
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const Text(
                                            'Средняя оценка: '
                                          ),
                                          Text(
                                            simestre.marks![index].commonMark!=null
                                                ?simestre.marks![index].commonMark!.toStringAsFixed(2)
                                                :'??',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const Text(
                                            'Средний процент пересдач: ',
                                          ),
                                          Text(
                                            simestre.marks![index].commonRetakes!=null
                                                ?simestre.marks![index].commonRetakes!=0
                                                ?(simestre.marks![index].commonRetakes!*100).toStringAsFixed(2)
                                                :'0'
                                                :'0',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const Text(
                                            '%',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const Text(
                                            'Дата сдачи: ',
                                          ),
                                          Text(
                                            simestre.marks![index].date!=null
                                                ?simestre.marks![index].date!=''
                                                ?simestre.marks![index].date!
                                                :'??'
                                                :'??',
                                            style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: const Color.fromRGBO(22, 49, 99, 0.9),
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Flexible(
                            fit: FlexFit.loose,
                            child: Card(
                              elevation: 4,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black12,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      simestre.marks![index].fullSubject!,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(22, 49, 99, 0.9),
                                        letterSpacing: 2,
                                      ),
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text(
                                          simestre.marks![index].hours!.toString(),
                                        ),
                                        Text(
                                          ' ч., ',
                                        ),
                                        Text(
                                          simestre.marks![index].formOfControl!,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          simestre.marks![index].mark!=null
                                              ? 'Оценка: '+simestre.marks![index].mark!.toString()
                                              : ''
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Пересдачи: '
                                        ),
                                        Text(
                                          simestre.marks![index].retakesCount!.toString(),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
  }
}