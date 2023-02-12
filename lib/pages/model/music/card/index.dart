import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/pages/model/music/component/image.dart';

class MusicItem extends StatelessWidget {
  final Music? music;
  const MusicItem({super.key, this.music});

  static double get height => 80;

  @override
  Widget build(BuildContext context) {
    if (music == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: InkWell(
        onTap: () => context.push('/home/music', extra: music),
        child: Container(
          height: height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.color1,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                height: height,
                width: height * .95,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.color2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MusicImage(music: music!),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music!.name!,
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.color4,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      music!.author!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.color4,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              buildPlay(),
              SizedBox(width: height - 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlay() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.color3.withOpacity(.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            PhosphorIcons.play_fill,
            size: 36,
            color: AppColors.color4,
          ),
        ),
      ),
    );
  }
}
