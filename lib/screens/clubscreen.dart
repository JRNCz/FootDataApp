import 'package:finalproject/data/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClubScreen extends StatefulWidget {
  const ClubScreen({super.key});

  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  Club s = Club(
      id: 0,
      name: '',
      shortName: '',
      tla: '',
      crest: '',
      founded: 0,
      venue: '',
      coach: '',
      activecomps: [],
      players: []);

  @override
  Widget build(BuildContext context) {
    s = (s.isEmpty()) ? ModalRoute.of(context)?.settings.arguments as Club : s;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Club players'),
          centerTitle: true,
          elevation: 0,
          leading: BackButton(onPressed: () {
            Navigator.pop(context, {});
          }),
        ),
        body: ListView.builder(
          itemCount: s.players.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              leading: CircleAvatar(
                  child: (s.crest.endsWith("svg"))
                      ? SvgPicture.network(s.crest)
                      : null,
                  backgroundImage: (s.crest.endsWith("png") ||
                          s.crest.endsWith("jpeg") ||
                          s.crest.endsWith("jpg"))
                      ? NetworkImage(s.crest)
                      : null,
                  backgroundColor: Colors.white),
              title: Text(s.players[index].name),
              subtitle: Text(
                  '${s.players[index].position} | ${s.players[index].nationality} | ${s.players[index].dateOfBirth}  '),
            ));
          },
        ));
  }
}
