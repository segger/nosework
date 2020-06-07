import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/pages/protocol_page.dart';
import 'package:nosework/services/result_service.dart';
import 'package:nosework/widgets/moment_app_bar_title.dart';
import 'package:nosework/widgets/moment_result_table.dart';
import 'package:nosework/widgets/nw_drawer.dart';

class MomentResultPage extends StatefulWidget {
  static const routeName = '/results-moment';
  MomentResultPage({Key key}) : super(key: key);
  @override
  _MomentResultPageState createState() => _MomentResultPageState();
}

class _MomentResultPageState extends State<MomentResultPage> {

  _add(BuildContext context, Moment moment) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => ProtocolPage(
          moment: moment,
          protocol: Protocol(),
          onSaved: () => setState(() {}),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Moment moment = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: MomentAppBarTitle(moment: moment),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Result>>(
        future: ResultService().getMomentResult(moment.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MomentResultTable(results: snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Nått gick fel');
          }
          return CircularProgressIndicator();
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _add(context, moment);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
