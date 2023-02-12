import 'package:go_router/go_router.dart';
import 'package:music_player/models/album.dart';
import 'package:music_player/models/music.dart';
import 'package:music_player/pages/model/album/detail/index.dart';
import 'package:music_player/pages/greeting/index.dart';
import 'package:music_player/pages/home/index.dart';
import 'package:music_player/pages/model/music/detail/index.dart';

part './routes.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: routes,
);
