import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/utils/utils.dart';

class MomentCard extends StatelessWidget {
  const MomentCard({Key key, @required this.moment, this.onPressed }) : super(key: key);

  final Moment moment;
  final Function(Moment) onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => {
          if (onPressed != null) {
            onPressed(moment)
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${moment.name}", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                    Text("${moment.printType()}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${Utils.toMinSec(moment.maxTime)}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}