import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/widgets/tournament_card.dart';

class TournamentPage extends StatefulWidget {
  TournamentPage({Key key}) : super(key: key);
  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  
  final List<Tournament> tournaments = new List<Tournament>.generate(1, (i) => Tournament(name: 'Sommarsniffen'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuneringar'),
      ),
      body: ListView(
        children: tournaments.map(
          (tournament) => TournamentCard(tournament: tournament))
          .toList(),
      ),
    );
  }
}
