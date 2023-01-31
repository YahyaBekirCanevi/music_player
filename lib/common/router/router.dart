import 'package:go_router/go_router.dart';
import 'package:music_player/pages/greeting/index.dart';
import 'package:music_player/pages/home/index.dart';

part './routes.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: routes,
);
