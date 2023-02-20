import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/pages/model/album/card/index.dart';
import 'package:music_player/pages/home/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeModel>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              buildAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate([
                  buildHeader("Albums"),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: AlbumItem.height,
                    width: double.maxFinite,
                    child: state.albumList.isEmpty
                        ? const SizedBox()
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: min(state.albumList.length, 10),
                            itemBuilder: (context, i) => state.albumItems[i],
                          ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 12),
                  buildHeader("Recently Played"),
                  const SizedBox(height: 12),
                  if (state.recentlyPlayed.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.recentlyPlayed.length,
                      itemBuilder: (context, i) => state.musicItems[i],
                    ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildHeader(title, {VoidCallback? seeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.color4,
              fontWeight: FontWeight.w300,
            ),
          ),
          InkWell(
            onTap: seeAll,
            child: Text(
              "See all",
              style: TextStyle(
                fontSize: 16,
                color:
                    AppColors.generateMaterialColor(AppColors.color4).shade300,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAppBar(context) {
    return SliverAppBar(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
      foregroundColor: AppColors.color4,
      elevation: 0,
      floating: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(PhosphorIcons.user_circle, size: 32),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(PhosphorIcons.bell),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(PhosphorIcons.gear),
        ),
      ],
    );
  }
}
