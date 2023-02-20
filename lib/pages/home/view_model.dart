import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/controller/album_controller.dart';
import 'package:music_player/controller/playlist_controller.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/models/user.dart';
import 'package:music_player/pages/home/model.dart';
import 'package:music_player/pages/model/album/card/index.dart';
import 'package:music_player/pages/model/music/card/index.dart';

class HomeBloc extends BlocBase<HomeModel> {
  HomeBloc() : super(HomeModel(user: User(name: "aaaa"))) {
    Future.microtask(() async => await getLists());
  }

  final AlbumController _albumController = AlbumController();
  final PlaylistController _playlistController = PlaylistController();

  getLists() async {
    List<Album> albums = await _albumController.getAlbums();
    List<AlbumItem> albumList = albums.map((e) => AlbumItem(album: e)).toList();

    List<Music> musics = await _playlistController.getMusics();
    List<MusicItem> musicList = musics.map((e) => MusicItem(music: e)).toList();

    emit(state
      ..albumList = albums
      ..albumItems = albumList
      ..recentlyPlayed = musics
      ..musicItems = musicList);
  }
}
