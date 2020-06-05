import 'package:flutter/material.dart';
import 'package:nosework/pages/moment_result_page.dart';
import 'package:nosework/pages/participant_page.dart';

import 'package:nosework/pages/tournament_page.dart';
import 'package:nosework/pages/contest_page.dart';
import 'package:nosework/pages/moment_page.dart';

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
        MomentPage.routeName: (context) => MomentPage(),
        ParticipantPage.routeName: (context) => ParticipantPage(),
        MomentResultPage.routeName: (context) => MomentResultPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TournamentPage(),
    );
  }
}