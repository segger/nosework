import 'package:flutter/material.dart';
import 'package:nosework/models/app_models.dart';
import 'package:nosework/pages/results/moment_result_page.dart';
import 'package:nosework/providers/db_repository.dart';
import 'package:nosework/widgets/moment_card.dart';
import 'package:nosework/widgets/nw_drawer.dart';

class MomentPage extends StatefulWidget {
    static const routeName = '/moments';

  MomentPage({Key key}) : super(key: key);
  @override
  _MomentPageState createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {

  @override
  Widget build(BuildContext context) {
    Contest contest = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(contest.name, style: TextStyle(color: Colors.white),),
          subtitle: Text('Moment', style: TextStyle(color: Colors.white)),
        ),
      ),
      drawer: NWDrawer(),
      body: FutureBuilder<List<Moment>>(
        future: DBRepository().getMomentList(contest.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return MomentCard(
                  moment: snapshot.data[index],
                  onPressed: (contest) => Navigator.pushNamed(context, MomentResultPage.routeName, arguments: contest),
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
