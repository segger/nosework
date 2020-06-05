import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/widgets/moment_app_bar.dart';

class ProtocolPage extends StatefulWidget {
  static const routeName = '/protocol';
  ProtocolPage({Key key}) : super(key: key);
  @override
  _ProtocolPageState createState() => _ProtocolPageState();
}

class _ProtocolPageState extends State<ProtocolPage> {
  @override
  Widget build(BuildContext context) {
    Moment moment = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: MomentAppBarTitle(moment: moment),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon: Icon(Icons.check), onPressed: () { print('saving...'); },),
          ),
        ],
      ),
      body: Center(child: Text('hallå'),)
    );
  }
}
