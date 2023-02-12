import 'package:music_player/models/music.dart';

class Playlist {
  final String? id;
  final String? creatorId;
  String? name;
  List<Music> musics;

  Playlist({
    this.id,
    this.creatorId,
    this.name,
    this.musics = const [],
  });
}
