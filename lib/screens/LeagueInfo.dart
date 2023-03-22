import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:finalproject/data/service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeagueInfo extends StatefulWidget {
  const LeagueInfo({super.key});

  @override
  State<LeagueInfo> createState() => _LeagueInfoState();
}

class _LeagueInfoState extends State<LeagueInfo> {
  List<Club> clubs = [];

  League league = League(
      count: 0,
      season: 'null',
      compInfo: Competition(
          id: 0, name: 'null', code: 'null', emblem: 'null', type: 'null'),
      clubs: []);

  @override
  Widget build(BuildContext context) {
    // league = (league.isNotEmpty())
    //     ? ModalRoute.of(context)?.settings.arguments as League
    //     : league;

    league = ModalRoute.of(context)?.settings.arguments as League;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a club'),
          centerTitle: true,
          elevation: 0,
          leading: BackButton(onPressed: () {
            Navigator.pop(context, {});
          }),
        ),
        body: ListView.builder(
          itemCount: league.clubs.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/club',
                    arguments: league.clubs[index]);
              },
              leading: CircleAvatar(
                  child: (league.clubs[index].crest.endsWith("svg"))
                      ? SvgPicture.network(league.clubs[index].crest)
                      : null,
                  backgroundImage: (league.clubs[index].crest.endsWith("png") ||
                          league.clubs[index].crest.endsWith("jpeg") ||
                          league.clubs[index].crest.endsWith("jpg"))
                      ? NetworkImage(league.clubs[index].crest)
                      : null,
                  backgroundColor: Colors.white),
              title: Text(league.clubs[index].name),
              isThreeLine: false,
              subtitle: Text(
                  'Coach: : ${league.clubs[index].coach} | Founded: ${league.clubs[index].founded} \nVenue: ${league.clubs[index].venue}'),
            ));
          },
        ));
  }
}
