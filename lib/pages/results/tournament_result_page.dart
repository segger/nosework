import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/widgets/nw_drawer.dart';

class TournamentResultPage extends StatefulWidget {
  static const routeName = '/result-tournaments';
  TournamentResultPage({Key key}) : super(key: key);
  @override
  _TournamentResultPageState createState() => _TournamentResultPageState();
}

class _TournamentResultPageState extends State<TournamentResultPage> {

  @override
  Widget build(BuildContext context) {
    Tournament tournament = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(tournament.name, style: TextStyle(color: Colors.white),),
          ),
      ),
      drawer: NWDrawer(),
      /*
      body: FutureBuilder<List<Result>>(
        future: ResultService().getTournamentResult(tournament.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TournamentResultTable(results: snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Nått gick fel');
          }
          return CircularProgressIndicator();
        }
      ),*/
      body: Center(child: Text('Not yet implemented ${tournament.name}'),),
    );
  }
}
