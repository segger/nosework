import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/pages/moment_page.dart';
import 'package:nosework/providers/db_repository.dart';
import 'package:nosework/widgets/contest_card.dart';
import 'package:nosework/widgets/nw_drawer.dart';

class ContestPage extends StatefulWidget {
  static const routeName = '/contests';

  ContestPage({Key key}) : super(key: key);
  @override
  _ContestPageState createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {

  @override
  Widget build(BuildContext context) {
    Tournament tournament = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(tournament.name, style: TextStyle(color: Colors.white),),
          subtitle: Text('Tävlingar', style: TextStyle(color: Colors.white)),
        ),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Contest>>(
        future: DBRepository().getContestList(tournament.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ContestCard(
                  contest: snapshot.data[index],
                  onPressed: (contest) => Navigator.pushNamed(context, MomentPage.routeName, arguments: contest),
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text('Nått gick fel');
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
