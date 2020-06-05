import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class MomentResultCard extends StatelessWidget {
  const MomentResultCard({Key key, @required this.result}) : super(key: key);

  final Protocol result;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("${result.participantId}"),
              Text("${result.sse}"),
              Text("${result.errors}"),
            ],
          ),
        ),
      ),
    );
  }
}