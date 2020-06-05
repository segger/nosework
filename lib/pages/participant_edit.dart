import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/providers/db_repository.dart';

class EditParticipant extends StatefulWidget {
  final Function onSaved;
  final Participant participant;
  EditParticipant({ this.participant, this.onSaved });

  @override
  _EditParticipantState createState() => _EditParticipantState();
}

class _EditParticipantState extends State<EditParticipant> {
  final _formKey = GlobalKey<FormState>();

  Participant participant;

  @override
  void initState() {
    participant = widget.participant;
    super.initState();
  }

  void _save() {
    _formKey.currentState.save();
    DBRepository().saveParticipant(participant);
    if (widget.onSaved != null) {
      widget.onSaved();
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                validator: (value) {
                  if (value.isEmpty) return 'Ange förare';
                  return null;
                },
                decoration: InputDecoration(labelText: 'Förare'),
                onSaved: (value) => participant.name = value,
              ),
              TextFormField(
                initialValue: participant.dog,
                validator: (value) {
                  if (value.isEmpty) return 'Ange hund';
                  return null;
                },
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