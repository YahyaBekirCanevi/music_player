import 'package:music_player/models/album.dart';
import 'package:music_player/models/user.dart';

class HomeModel {
  final User user;
  List<Album> albumList;

  HomeModel({required this.user, this.albumList = const []});
}
