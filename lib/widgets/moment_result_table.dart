import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';

class MomentResultTable extends StatelessWidget {
  const MomentResultTable({Key key, @required this.results}) : super(key: key);

  final List<Result> results;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text('Placering')),
            DataColumn(label: Text('Förare & hund')),
            DataColumn(label: Text('Tid')),
            DataColumn(label: Text('Poäng')),
            DataColumn(label: Text('Fel')),
            DataColumn(label: Text('SSE')),
            DataColumn(label: Text('TP')),
          ],
          rows: _rows(results)
        ),
      ),
    );
  }

  List<DataRow> _rows(List<Result> results) {
    return results.map((res) => DataRow(
      cells: <DataCell>[
        DataCell(Text("${res.placement}")),
        DataCell(Text("${res.participant}")),
        DataCell(Text("${res.time}")),
        DataCell(Text("${res.points}")),
        DataCell(Text("${res.errors}")),
        DataCell(Text(res.sse ? "X" : "")),
        DataCell(Text("${res.tournamentPoints}"))
      ]
    )).toList();
  }
}