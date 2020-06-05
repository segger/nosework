import 'package:flutter/material.dart';
import 'package:nosework/pages/tournament_page.dart';

void main() {
  runApp(NWApp());
}

class NWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noseworktuneringar',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TournamentPage(),
    );
  }
}