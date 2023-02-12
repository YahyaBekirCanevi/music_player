// ignore_for_file: avoid_print

import 'package:music_player/common/client/client.dart';
import 'package:music_player/common/client/constants.dart';
import 'package:music_player/models/music.dart';

class PlaylistController {
  late Client _client;
  late Map _map;

  PlaylistController() {
    _client = Client();
    _map = ClientConstants.paths;
  }

  Future<List<Music>> getMusics() async {
    try {
      final response = await _client.getMethod(
        _map["randomImage2"],
      );
      if (response?.data == null) {
        throw Exception("Responded as NULL");
      }
      List<Music>? users = [];
      for (Map<String, dynamic> album in response!.data) {
        users.add(Music.fromJson(album));
      }
      return users;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
