class Music {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;
  String? name;
  Duration? duration;

  Music({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
    this.name = "Music Name",
    this.duration = const Duration(minutes: 2, seconds: 18),
  });

  Music.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    downloadUrl = json['download_url'];
    name = "Music Name";
    duration = const Duration(minutes: 2, seconds: 18);
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
