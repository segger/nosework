import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nosework/utils/utils.dart';

class SearchAreaExpansion extends StatefulWidget {

  @override
  _SearchAreaExpansionState createState() => _SearchAreaExpansionState();
}

class _SearchAreaExpansionState extends State<SearchAreaExpansion> {

  bool _found = false;
  int _errors = 0;
  int _time = 0;

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
              onChanged: (value) {      
                setState(() {
                  _found = value;
                });
              },
              activeColor: Colors.purple,
              secondary: Icon(Icons.star),
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
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return "Skriv i sluttid";
                }
                if (Utils.toMillis(value) == null) {
                  return "Skriv tiden som MM.ss.00";
                }
                return null;
              },
            ),
          ),
        ],
      );
  }

}