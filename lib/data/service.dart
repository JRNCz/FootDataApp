// ignore_for_file: public_member_api_docs, sort_constructors_first
class League {
  int count;
  String season;
  Competition compInfo;
  List<Club> clubs;

  League({
    required this.count,
    required this.season,
    required this.compInfo,
    required this.clubs,
  });

  @override
  String toString() {
    return 'League(count: $count, season: $season, compInfo: $compInfo, clubs: ${clubs.join(', ')})';
  }

  bool isNotEmpty() {
    if (count != 0 || count != null) {
      return true;
    } else {
      return false;
    }
  }
}

class Competition {
  int id;
  String name;
  String code;
  String type;
  String emblem;

  Competition(
      {required this.id,
      required this.name,
      required this.code,
      required this.emblem,
      required this.type});

  @override
  String toString() {
    return 'Competition(id: $id, name: $name, code: $code, type: $type, emblem: $emblem)';
  }
}

class Club {
  int id;
  String name;
  String shortName;
  String tla;
  String crest;
  int founded;
  String venue;
  String coach;
  List<Competition> activecomps;
  List<Player> players;

  Club({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
    required this.founded,
    required this.venue,
    required this.coach,
    required this.activecomps,
    required this.players,
  });

  bool isEmpty() {
    if (id != 0 || id != null)
      return true;
    else
      return false;
  }

  // TODO: representar lista em string do active comps
  @override
  String toString() {
    // Doesn't have player because it would create a very big string

    String compString = '';

    for (int i = 0; i < activecomps.length; i++) {
      compString = compString + activecomps[i].toString();
    }

    return 'Club(id: $id, name: $name, shortName: $shortName, tla: $tla, crest: $crest, founded: $founded, venue: $venue, coach : $coach';
  }
}

class Player {
  int id;
  String name;
  String position;
  String dateOfBirth;
  String nationality;

  Player({
    required this.id,
    required this.name,
    required this.position,
    required this.dateOfBirth,
    required this.nationality,
  });

  @override
  String toString() {
    return 'Player(id: $id, name: $name, position: $position, dateOfBirth: $dateOfBirth, nationality: $nationality)';
  }
}
