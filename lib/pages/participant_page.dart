import 'package:flutter/material.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/pages/participant_edit.dart';
import 'package:nosework/providers/db_repository.dart';
import 'package:nosework/widgets/nw_drawer.dart';
import 'package:nosework/widgets/participant_card.dart';

class ParticipantPage extends StatefulWidget {
  static const routeName = '/participants';
  ParticipantPage({Key key}) : super(key: key);
  @override
  _ParticipantPageState createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {

  void _modify(BuildContext context, Participant participant) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => EditParticipant(
          participant: participant,
          onSaved: () => setState(() {})
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deltagare'),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Participant>>(
        future: DBRepository().getParticipants(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ParticipantCard(
                  participant: snapshot.data[index],
                  onPressed: (participant) => _modify(context, participant),
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text('Nått gick fel');
          }
          return CircularProgressIndicator();
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modify(context, Participant());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
