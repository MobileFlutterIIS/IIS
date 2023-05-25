import 'package:flutter/material.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/user_entity.dart';
import 'package:iis/services/CheckValidatingUserAndPassword/CertificateGroupAnouncements.dart';
import 'package:iis/main.dart';

class AnouncementPage extends StatelessWidget {
  final List<Anouncement> anouncement;
  const AnouncementPage({Key? key, required this.anouncement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1046,
        leadingWidth: MediaQuery.of(context).size.width * 0.046,
        title: Row(
          children: const [
            Text(
              'Объявления',
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
       // height: MediaQuery.of(context).size.height,
       // width: MediaQuery.of(context).size.width,
        children: [
          Expanded(
            child: anouncement.length!= 0 ?ListView.builder(
              itemCount: anouncement.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context,index)
                  {
                    return Container(
                      child: Card(
                        elevation: 4,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            //color: Colors.black12,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${anouncement[0].content}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text('${anouncement[0].startTime!} - ${anouncement[0].endTime!}'),
                                Text('${anouncement[0].date!}'),
                              ],
                            ),
                          Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${anouncement[0].auditory!}'),
                          Text('${anouncement[0].employee!}'),
                           ],
                          ),
                          ],
                        ),
                      ),
                    );
                  }
        ): Center(child: Icon(Icons.error_outline_rounded),),
          )
        ],
      ),
    );
  }
}
