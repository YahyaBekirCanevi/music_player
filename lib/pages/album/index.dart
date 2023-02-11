import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/pages/album/image.dart';

class AlbumItem extends StatelessWidget {
  final Album? album;
  const AlbumItem({super.key, this.album});

  static double get height => 260;

  @override
  Widget build(BuildContext context) {
    if (album == null) return const SizedBox();
    return Container(
      width: 240,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: AppColors.color1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(64),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: InkWell(
              onTap: () => context.push('/home/album', extra: album),
              child: SizedBox.expand(
                child: AlbumImage(album: album!),
              ),
            ),
          ),
          buildDisc(),
          buildSeeAlbum(),
        ],
      ),
    );
  }

  Widget buildDisc() {
    return Align(
      alignment: album?.downloadUrl == null
          ? Alignment.center
          : const Alignment(.88, -.88),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.color1.withOpacity(.6),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            PhosphorIcons.disc,
            size: 52,
            color: AppColors.color4.withOpacity(.88),
          ),
        ),
      ),
    );
  }

  Widget buildSeeAlbum() {
    return Positioned(
      bottom: 8,
      left: 8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.color3.withOpacity(.8),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: const [
            SizedBox(width: 8),
            Icon(
              PhosphorIcons.playlist,
              size: 24,
              color: AppColors.color4,
            ),
            SizedBox(width: 8),
            Text(
              'See Album',
              style: TextStyle(
                color: AppColors.color4,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
