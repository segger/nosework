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
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<int>> _participants = [];
  int _selectedParticipant;
  bool _sseValue = false;

  int _totPoints = 25;
  int _totErrors = 0;
  int _totTime = 37000;

  @override
  void initState() {  
    _participants.add(DropdownMenuItem(child: Text('Jojo & Kira'), value: 1,));
    _participants.add(DropdownMenuItem(child: Text('Jojo & Niko'), value: 2,));

    super.initState();
  }

  void _save() {
    print('save protocol');
    _formKey.currentState.save();
    // DBRepository().saveProtocol();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Moment moment = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: MomentAppBarTitle(moment: moment),
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
              _participant(),
              _sse(),
              _hides(),
              _result(),
              _comment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _participant() {
    return DropdownButtonFormField<int>(
          items: _participants,
          value: _selectedParticipant,
          onChanged: (value) {
            setState(() {
              _selectedParticipant = value;
            });
          },
          decoration: InputDecoration(
            labelText: 'Deltagare',
          ),
        );
  }

  Widget _sse() {
    return CheckboxListTile(
      title: Text('SSE'),
      value: _sseValue,
      onChanged: (value) {
        setState(() {
          _sseValue = value;
        });
      },
    );
  }

  Widget _hides() {
    return Center(child: Text('Sökområden'),);
  }

  Widget _result() {
    return Card(
      elevation: 4.0,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Poäng"),
              Text("$_totPoints"),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Fel"),
              Text("$_totErrors"),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Total tid"),
              Text("$_totTime"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _comment() {
    return Center(child: Text('Kommentar'),);
  }
}
