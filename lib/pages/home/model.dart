import 'package:music_player/models/album.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/models/user.dart';

class HomeModel {
  final User user;
  List<Album> albumList;
  List<Music> recentlyPlayed;

  HomeModel({
    required this.user,
    this.albumList = const [],
    this.recentlyPlayed = const [],
  });
}
