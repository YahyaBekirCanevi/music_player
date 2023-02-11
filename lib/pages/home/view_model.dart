import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/controller/album_controller.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/models/user.dart';
import 'package:music_player/pages/home/model.dart';

class HomeBloc extends BlocBase<HomeModel> {
  HomeBloc() : super(HomeModel(user: User(name: "aaaa"))) {
    Future.microtask(() async => await getImageList());
  }

  final AlbumController _albumController = AlbumController();

  getImageList() async {
    List<Album> list = await _albumController.getAlbums();
    emit(state..albumList = list);
  }
}
