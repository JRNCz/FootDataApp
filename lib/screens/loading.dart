// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:finalproject/data/service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Loading : Gets information regarding leagues,teams and players of the following countries :

// Brazil's  Serie A ("id": 2013)
// England's  Premier League  ("id": 2021)
// Europe's Champions League ("id": 2001)
// France's Ligue1 ("id": 2015)
// Germany's Bundesliga ("id": 2002)
// Italy's Serie A ("id": 2019)
// Netherland's Eredivisie ("id": 2003)
// Portugal's Primeira Liga ("id": 2017)
// Spain's Primera Division ("id": 2014)

// In first stages of the prototype only Portugal and Champions League will be requested to the API
// API used to gather football information : https://www.football-data.org/
// API Endpoint to get Portuguese League, clubs and players info :

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Variables and decoding

  late int clubCount;
  late String season;

  League createLeague(var jsonData) {
    Competition comp = Competition(
        id: jsonData['competition']['id'] ?? 0,
        name: jsonData['competition']['name'] ?? 'null',
        code: jsonData['competition']['code'] ?? 'null',
        type: jsonData['competition']['type'] ?? 'null',
        emblem: jsonData['competition']['emblem'] ?? 'null');

    League league = League(
        count: jsonData['count'],
        season: jsonData['filters']['season'],
        compInfo: comp,
        clubs: (jsonData['teams'] as List)
            .map(
              (club) => Club(
                id: club['id'] ?? 0,
                name: club['name'] ?? 'null',
                shortName: club['shortName'] ?? 'null',
                tla: club['tla'] ?? 'null',
                crest: club['crest'] ?? 'null',
                founded: club['founded'] ?? 0,
                venue: club['venue'] ?? 'null',
                coach: club['coach']['name'] ?? 'null',
                activecomps: (club['runningCompetitions'] as List)
                    .map((comp) => Competition(
                        id: comp['id'] ?? 0,
                        name: comp['name'] ?? 'null',
                        code: comp['code'] ?? 'null',
                        emblem: comp['emblem'] ?? 'null',
                        type: comp['type'] ?? 'null'))
                    .toList(),
                players: (club['squad'] as List)
                    .map((player) => Player(
                        id: player['id'] ?? 0,
                        name: player['name'] ?? 'null',
                        position: player['position'] ?? 'null',
                        dateOfBirth: player['dateOfBirth'] ?? 'null',
                        nationality: player['nationality'] ?? 'null'))
                    .toList(),
              ),
            )
            .toList());

    return league;
  }

  Future<void> getData() async {
    List<String> leagueString = [
      "2017",
      "2021",
      "CL",
      "FL1",
      "PD",
      "SA",
      "BL1",
    ];

    Map<int, League> leagueStorage = {};

    // PT

    for (int i = 0; i < leagueString.length; i++) {
      Response response = await get(
          Uri.parse(
              'https://api.football-data.org/v4/competitions/${leagueString[i]}/teams'),
          headers: {'X-Auth-Token': 'ef59d405b6dd4ab5a0534432197002c2'});

      var jsonData = jsonDecode(response.body);
      League leagueholder = createLeague(jsonData);
      leagueStorage[i] = leagueholder;
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: leagueStorage);
  }

  @override
  void initState() {
    //print('InitState');
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitWanderingCubes(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
