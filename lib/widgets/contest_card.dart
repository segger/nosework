import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class ContestCard extends StatelessWidget {
  const ContestCard({Key key, @required this.contest, this.onPressed }) : super(key: key);

  final Contest contest;
  final Function(Contest) onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => {
          if (onPressed != null) {
            onPressed(contest)
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("${contest.name}", style: TextStyle(fontSize: 24.0),)
            ),
          ],
        ),
      ),
    );
  }
}