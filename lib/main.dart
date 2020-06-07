import 'package:flutter/material.dart';

import 'package:nosework/pages/pages.dart';

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
        TournamentResultPage.routeName: (context) => TournamentResultPage(),
        MomentResultPage.routeName: (context) => MomentResultPage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: TournamentPage(),
    );
  }
}