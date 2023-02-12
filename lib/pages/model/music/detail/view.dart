import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/pages/model/music/component/image.dart';

class MusicDetailPage extends StatelessWidget {
  final Music music;
  const MusicDetailPage({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          music.name!,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              PhosphorIcons.playlist,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: MusicImage(music: music, tag: null),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: ColoredBox(
              color: Colors.black.withOpacity(.4),
              child: const SizedBox.expand(),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    music.author!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white54,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Container(
                        width: width * .8,
                        height: width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.4),
                              spreadRadius: 4,
                              blurRadius: 12,
                            )
                          ],
                        ),
                        child: MusicImage(music: music),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Slider(
                          activeColor: AppColors.color3,
                          value: 0.5,
                          onChanged: (value) {},
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  PhosphorIcons.caret_left,
                                  size: 48,
                                  color: Colors.white70,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  PhosphorIcons.play,
                                  size: 64,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  PhosphorIcons.caret_right,
                                  size: 48,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  PhosphorIcons.heart,
                                  size: 36,
                                  color: Colors.red.shade300,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  PhosphorIcons.share_network,
                                  size: 36,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
