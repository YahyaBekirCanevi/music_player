import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:music_player/common/constant/colors.dart';
import 'package:music_player/pages/album/index.dart';
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
      appBar: buildAppBar(),
      body: ListView(
        children: [
          buildHeader("Albums"),
          const SizedBox(height: 12),
          BlocBuilder<HomeBloc, HomeModel>(
            builder: (context, state) => SizedBox(
              height: state.albumList.isEmpty ? 0 : AlbumItem.height,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: min(state.albumList.length, 10),
                itemBuilder: (context, i) => AlbumItem(
                  album: state.albumList[i],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          buildHeader("Recently Played"),
          const SizedBox(height: 12),
          BlocBuilder<HomeBloc, HomeModel>(
            builder: (context, state) => state.albumList.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(state.albumList.length, 10),
                    itemBuilder: (context, i) => AlbumItem(
                      album: state.albumList[i],
                    ),
                  ),
          ),
        ],
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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.color4,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(PhosphorIcons.list),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(PhosphorIcons.bell),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(PhosphorIcons.gear),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(PhosphorIcons.user),
        ),
      ],
    );
  }
}
