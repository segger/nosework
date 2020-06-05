import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({Key key, @required this.participant}) : super(key: key);

  final Participant participant;
  
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
              child: Text("${participant.name} & ${participant.dog}")
            ),
          ],
        ),
      ),
    );
  }
}