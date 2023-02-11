part of './router.dart';

final routes = <RouteBase>[
  GoRoute(
    path: '/welcome',
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'album',
        builder: (context, state) =>
            AlbumDetailPage(album: state.extra as Album),
      ),
    ],
  ),
];
