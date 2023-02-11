import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/album.dart';

class AlbumImage extends StatelessWidget {
  final Album album;
  const AlbumImage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    if (album.downloadUrl == null) return const SizedBox();
    return Hero(
      tag: album.id!,
      child: CachedNetworkImage(
        imageUrl: album.downloadUrl!,
        imageBuilder: (context, imageProvider) => DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
