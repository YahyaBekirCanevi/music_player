import 'package:music_player/models/music.dart';
import 'package:music_player/models/playlist.dart';

class User {
  final String? id;
  String? name;
  List<Music> allMusics;
  List<Playlist> playlists;

  User({
    this.id,
    this.name,
    this.allMusics = const [],
    this.playlists = const [],
  });
}
