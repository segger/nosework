import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({Key key, @required this.tournament, this.onPressed }) : super(key: key);

  final Tournament tournament;
  final Function(Tournament) onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => {
          if (onPressed != null) {
            onPressed(tournament)
          }
        },
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