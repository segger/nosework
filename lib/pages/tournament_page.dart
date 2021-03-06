import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/pages/contest_page.dart';
import 'package:nosework/providers/db_repository.dart';
import 'package:nosework/widgets/nw_drawer.dart';
import 'package:nosework/widgets/tournament_card.dart';

class TournamentPage extends StatefulWidget {
  static const routeName = '/tournaments';
  TournamentPage({Key key}) : super(key: key);
  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuneringar'),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Tournament>>(
        future: DBRepository().getTournamentList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return TournamentCard(
                  tournament: snapshot.data[index],
                  onPressed: (tournament) => Navigator.pushNamed(context, ContestPage.routeName, arguments: tournament),
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
