import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key key, @required this.tournament}) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("${tournament.name}", style: TextStyle(fontSize: 26.0),)
            ),
          ],
        ),
      ),
    );
  }
}