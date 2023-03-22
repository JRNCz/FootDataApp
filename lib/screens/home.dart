import 'package:flutter/material.dart';
import 'package:finalproject/data/service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<int, League> leaguemap = {};

  @override
  Widget build(BuildContext context) {
    leaguemap = (leaguemap.isNotEmpty)
        ? leaguemap
        : ModalRoute.of(context)?.settings.arguments as Map<int, League>;

    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Choose the league'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: leaguemap.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/league',
                    arguments: leaguemap[index]);
              },
              leading: CircleAvatar(
                  child: (leaguemap[index]!.compInfo.emblem.endsWith("svg"))
                      ? SvgPicture.network(leaguemap[index]!.compInfo.emblem)
                      : null,
                  backgroundImage: (leaguemap[index]!
                              .compInfo
                              .emblem
                              .endsWith("png") ||
                          leaguemap[index]!.compInfo.emblem.endsWith("jpeg") ||
                          leaguemap[index]!.compInfo.emblem.endsWith("jpg"))
                      ? NetworkImage(leaguemap[index]!.compInfo.emblem)
                      : null,
                  backgroundColor: Colors.white),
              title: Text('${leaguemap[index]!.compInfo.name}'),
            ));
          },
        ));
  }
}
