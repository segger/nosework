import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nosework/models/app_models.dart';
import 'package:nosework/providers/db_repository.dart';
import 'package:nosework/utils/utils.dart';
import 'package:nosework/widgets/moment_app_bar_title.dart';
import 'package:nosework/widgets/search_area_expansion.dart';

class ProtocolPage extends StatefulWidget {
  final Moment moment;
  ProtocolPage({Key key, this.moment }) : super(key: key);

  @override
  _ProtocolPageState createState() => _ProtocolPageState();
}

class _ProtocolPageState extends State<ProtocolPage> {
  final _formKey = GlobalKey<FormState>();

  Moment moment;

  List<DropdownMenuItem<int>> _participants = [];
  int _selectedParticipant;
  bool _sseValue = false;

  int _totPoints = 25;
  int _totErrors = 0;
  int _totTime = 37130;

  String _commentValue;

  @override
  void initState() {
    moment = widget.moment;

    DBRepository().getParticipants().then((participants) => {
      _participants = participants.expand((p) => {
        DropdownMenuItem(child: Text("${p.name} & ${p.dog}"), value: p.id)
      }).toList()
    });

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
      body: GestureDetector(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _result(),
                  _participant(),
                  _sse(),
                  _hides(),
                  _comment(),
                ],
              ),
            ),
          ),
        ),
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  Widget _participant() {
    return DropdownButtonFormField<int>(
          items: _participants,
          value: _selectedParticipant,
          validator: (value) {
            if (value == null) {
              return 'Du måste välja en deltagare';
            }
            return null;
          },
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
      title: Text('SSE', style: TextStyle(fontSize: 15.0, color: Colors.black54),),
      value: _sseValue,
      onChanged: (value) {
        setState(() {
          _sseValue = value;
        });
      },
      activeColor: Colors.purple,
      secondary: Icon(Icons.pets),
    );
  }

  Widget _hides() {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return SearchAreaExpansion();
          },
    );
  }

  Widget _result() {
    return Card(
      elevation: 2.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _cardCol("Poäng", "$_totPoints"),
          _cardCol("Fel", "$_totErrors"),
          _cardCol("Total tid", "${Utils.toMinSecMillis(_totTime)}"),
        ],
      ),
    );
  }

  Widget _cardCol(String header, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$header", style: TextStyle(fontWeight: FontWeight.bold),),
          Text("$value"),
        ],
      ),
    );
  }

  Widget _comment() {
    return TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        initialValue: _commentValue,
        onChanged: (value) {
          setState(() {
            _commentValue = value;
          });
        },
        decoration: InputDecoration(
          labelText: "Kommentar"
        ),
    );
  }
}
