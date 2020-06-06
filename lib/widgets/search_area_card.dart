import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAreaCard extends StatefulWidget {

  @override
  _SearchAreaCardState createState() => _SearchAreaCardState();
}

class _SearchAreaCardState extends State<SearchAreaCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sökområde1"),
          ),
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
              child: CheckboxListTile(
                title: Text('Gömma 2', style: TextStyle(fontSize: 15.0, color: Colors.black54),),
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
      ),
    );
  }

}