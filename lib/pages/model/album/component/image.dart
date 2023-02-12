import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:music_player/common/components/decoration_cached_network_image.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/album.dart';

class AlbumImage extends DecorationCachedNetworkImage {
  final Album album;
  AlbumImage({
    super.key,
    String? tag,
    required this.album,
  }) : super(
          tag: tag == null ? null : album.id!,
          imageUrl: album.downloadUrl,
          error: const Icon(
            PhosphorIcons.disc,
            size: 64,
            color: AppColors.color4,
          ),
        );
}
