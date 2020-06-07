import 'package:flutter/material.dart';

import 'package:nosework/widgets/nw_drawer.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/results';
  ResultPage({Key key}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
      ),
      drawer: NWDrawer(),
      body: Center(child: Text('Not yet implemented')),
    );
  }
}
