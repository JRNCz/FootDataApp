import 'package:flutter/material.dart';
import 'package:finalproject/screens/home.dart';
import 'package:finalproject/screens/loading.dart';
import 'package:finalproject/screens/leagueInfo.dart';
import 'package:finalproject/screens/clubscreen.dart';

void main() {
  runApp(
    MaterialApp(initialRoute: '/loading', routes: {
      '/loading': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/league': (context) => LeagueInfo(),
      '/club': (context) => ClubScreen(),
    }),
  );
}
