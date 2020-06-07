import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/utils/utils.dart';

class SearchAreaExpansion extends StatefulWidget {
  final Moment moment;
  final Function(SearchAreaDto) onChange;
  SearchAreaExpansion({Key key, this.moment, this.onChange});

  @override
  _SearchAreaExpansionState createState() => _SearchAreaExpansionState();
}

class _SearchAreaExpansionState extends State<SearchAreaExpansion> {
  Moment moment;
  SearchAreaDto dto = SearchAreaDto();

  bool _found = false;
  int _errors = 0;
  int _time = 0;

  bool _timeDirty = false;

  @override
  void initState() {
    moment = widget.moment;
    _time = moment.maxTime;
    dto.time = moment.maxTime;

    super.initState();
  }

  bool _isMaxTime(int value) {
    return value == moment.maxTime;
  }

  _onChangeFound(bool value) {
    dto.found = value;
    setState(() {
      _found = value;
    });
    widget.onChange(dto);
  }

  _onChangeErrors(String errors) {
    dto.errors = int.parse(errors);
    widget.onChange(dto);
  }

  _onChangeTime(String time) {
    dto.time = Utils.toMillis(time);
    widget.onChange(dto);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Sökområde1"),
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CheckboxListTile(
              title: Text('Gömma 1', style: TextStyle(fontSize: 15.0, color: Colors.black54),),
              value: _found,
              onChanged: (value) => _onChangeFound(value),
              activeColor: Colors.purple,
              secondary: _found ? Icon(Icons.star) : Icon((Icons.star_border)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              initialValue: _errors.toString(),
              decoration: InputDecoration(
                labelText: "Fel",
                labelStyle: TextStyle(fontSize: 12.0),
                contentPadding: const EdgeInsets.all(2.0),
              ),
              onChanged: (value) => _onChangeErrors(value),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
           ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              initialValue: Utils.toMinSecMillis(_time, delimeter: ".").toString(),
              decoration: InputDecoration(
                labelText: "Tid",
                labelStyle: TextStyle(fontSize: 12.0),
                contentPadding: const EdgeInsets.all(2.0),
                hintText: "MM.ss.00"
              ),
              onChanged: (value) => _onChangeTime(value),
              // onSaved: _onSaved(),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return "Skriv i sluttid";
                }
                if (Utils.toMillis(value) == null) {
                  return "Skriv tiden som MM.ss.00";
                }
                if (_found && _isMaxTime(Utils.toMillis(value)) && !_timeDirty) {
                  _timeDirty = true;
                  return "När hittades gömman?";
                }
                return null;
              },
            ),
          ),
        ],
      );
  }

}