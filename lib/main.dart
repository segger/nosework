import 'package:flutter/material.dart';

import 'package:nosework/pages/tournament_page.dart';
import 'package:nosework/pages/contest_page.dart';

void main() {
  runApp(NWApp());
}

class NWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noseworktuneringar',
      initialRoute: TournamentPage.routeName,
      routes: {
        TournamentPage.routeName: (context) => TournamentPage(),
        ContestPage.routeName: (context) => ContestPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TournamentPage(),
    );
  }
}