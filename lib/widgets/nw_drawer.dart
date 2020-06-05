import 'package:flutter/material.dart';

import 'package:nosework/pages/tournament_page.dart';

class NWDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('NW Tuneringar', style: TextStyle(fontSize: 24.0),),
                Text('@segger'),
              ],
            ),
            decoration: BoxDecoration(color: Colors.purple),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Start'),
            onTap: () {
              Navigator.pushNamed(context, TournamentPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}