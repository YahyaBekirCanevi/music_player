import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:music_player/common/components/decoration_cached_network_image.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/music.dart';

class MusicImage extends DecorationCachedNetworkImage {
  final Music music;
  MusicImage({
    super.key,
    String? tag,
    required this.music,
  }) : super(
          tag: tag == null ? null : music.id!,
          imageUrl: music.downloadUrl,
          error: const Icon(
            PhosphorIcons.music_notes,
            size: 32,
            color: AppColors.color4,
          ),
        );
}
