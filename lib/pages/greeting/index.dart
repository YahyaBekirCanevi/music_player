import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => context.go('/'),
      );
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Placeholder(
          color: Colors.amber[200]!,
          child: const Center(
            child: Text("Welcome"),
          ),
        ),
      ),
    );
  }
}
