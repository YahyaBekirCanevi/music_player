// ignore_for_file: avoid_print

import 'package:music_player/common/client/client.dart';
import 'package:music_player/common/client/constants.dart';
import 'package:music_player/models/album.dart';

class AlbumController {
  late Client _client;
  late Map _map;

  AlbumController() {
    _client = Client();
    _map = ClientConstants.paths;
  }

  Future<List<Album>> getAlbums() async {
    try {
      final response = await _client.getMethod(
        _map["randomImage"],
      );
      if (response?.data == null) {
        throw Exception("Responded as NULL");
      }
      List<Album>? users = [];
      for (Map<String, dynamic> album in response!.data) {
        users.add(Album.fromJson(album));
      }
      return users;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
