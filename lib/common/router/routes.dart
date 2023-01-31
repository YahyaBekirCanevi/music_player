part of './router.dart';

final routes = <RouteBase>[
  GoRoute(
    path: '/welcome',
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
];
