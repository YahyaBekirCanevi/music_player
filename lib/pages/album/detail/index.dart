import 'package:flutter/material.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/pages/album/image.dart';

class AlbumDetailPage extends StatelessWidget {
  final Album album;
  const AlbumDetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.color1,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                album.author!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.6, 1],
                  ),
                ),
                child: AlbumImage(album: album),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
