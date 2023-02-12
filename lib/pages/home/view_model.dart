import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/controller/album_controller.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/models/user.dart';
import 'package:music_player/pages/home/model.dart';

class HomeBloc extends BlocBase<HomeModel> {
  HomeBloc() : super(HomeModel(user: User(name: "aaaa"))) {
    Future.microtask(() async => await getLists());
  }

  final AlbumController _albumController = AlbumController();
  final PlaylistController _playlistController = PlaylistController();

  getLists() async {
    List<Album> albums = await _albumController.getAlbums();
    List<Music> musics = await _playlistController.getMusics();
    emit(state
      ..albumList = albums
      ..recentlyPlayed = musics);
  }
}
