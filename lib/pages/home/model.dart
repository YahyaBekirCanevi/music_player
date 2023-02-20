import 'package:music_player/models/album.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/models/user.dart';
import 'package:music_player/pages/model/album/card/index.dart';
import 'package:music_player/pages/model/music/card/index.dart';

class HomeModel {
  final User user;
  List<Album> albumList;
  List<Music> recentlyPlayed;

  List<AlbumItem> albumItems;
  List<MusicItem> musicItems;

  HomeModel({
    required this.user,
    this.albumList = const [],
    this.recentlyPlayed = const [],
    this.albumItems = const [],
    this.musicItems = const [],
  });
}
