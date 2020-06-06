import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAreaExpansion extends StatefulWidget {

  @override
  _SearchAreaExpansionState createState() => _SearchAreaExpansionState();
}

class _SearchAreaExpansionState extends State<SearchAreaExpansion> {

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Sökområde1"),
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CheckboxListTile(
              title: Text('Gömma 1', style: TextStyle(fontSize: 15.0, color: Colors.black54),),
              value: true,
                onChanged: (value) {          
                },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
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
              decoration: InputDecoration(
                labelText: "Tid",
                labelStyle: TextStyle(fontSize: 12.0),
                contentPadding: const EdgeInsets.all(2.0),
                hintText: "MM.ss,000"
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      );
  }

}