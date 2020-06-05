import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/services/result_service.dart';
import 'package:nosework/widgets/moment_result_card.dart';
import 'package:nosework/widgets/nw_drawer.dart';

class MomentResultPage extends StatefulWidget {
  static const routeName = '/contestresults';
  MomentResultPage({Key key}) : super(key: key);
  @override
  _MomentResultPageState createState() => _MomentResultPageState();
}

class _MomentResultPageState extends State<MomentResultPage> {
  @override
  Widget build(BuildContext context) {
    Moment moment = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${moment.name}", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                    Text("${moment.printType()}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("${moment.printMaxTime()}")
              ),
            ],
          ),
        ),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Protocol>>(
        future: ResultService().getMomentResult(moment.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return MomentResultCard(
                  result: snapshot.data[index],
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text('Nått gick fel');
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
