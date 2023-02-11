import 'package:music_player/models/playlist.dart';

class Album {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;
  Playlist? playlist;

  Album({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    downloadUrl = json['download_url'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'width': width,
        'height': height,
        'url': url,
        'downloadUrl': downloadUrl,
      };
}
