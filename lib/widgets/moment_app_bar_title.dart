import 'package:flutter/widgets.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/utils/utils.dart';

class MomentAppBarTitle extends StatelessWidget {
  MomentAppBarTitle({Key key, this.moment});
  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${moment.name}", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                Text("${Utils.momentType(moment.type)}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("${Utils.toMinSec(moment.maxTime)}")
           ),
        ],
      ),
    );
  }
}