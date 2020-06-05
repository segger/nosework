import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class EditParticipant extends StatefulWidget {
  static const routeName = '/participantedit';

  EditParticipant();

  @override
  _EditParticipantState createState() => _EditParticipantState();
}

class _EditParticipantState extends State<EditParticipant> {
  final _formKey = GlobalKey<FormState>();

  void _save() {
    _formKey.currentState.save();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Participant participant = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Deltagare'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _save();
                }
              },
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: participant.name,
                decoration: InputDecoration(labelText: 'Förare'),
                onSaved: (value) => participant.name = value,
              ),
              TextFormField(
                initialValue: participant.dog,
                decoration: InputDecoration(labelText: 'Hund'),
                onSaved: (value) => participant.dog = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

}