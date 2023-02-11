import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/common/constant/colors.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color begin = AppColors.color1;
    const Color end = AppColors.color2;
    useEffect(() {
      Future.delayed(
        3.seconds,
        () => context.go('/home'),
      );
      return null;
    }, []);

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              PhosphorIcons.music_notes,
              size: 36,
              color: AppColors.color4,
            )
                .animate()
                .slideY(
                  delay: .8.seconds,
                  duration: 1.2.seconds,
                  begin: 1.2,
                  end: 0,
                )
                .fade(
                  delay: 1.2.seconds,
                  duration: 1.seconds,
                  begin: 0,
                  end: 1,
                )
                .scale(
                  delay: 1.4.seconds,
                  duration: .6.seconds,
                  begin: const Offset(.8, .8),
                  end: const Offset(2, 2),
                ),
            const SizedBox(height: 24),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 36,
                color: AppColors.color4,
              ),
            ).animate().fade(
                  delay: .6.seconds,
                  duration: 1.seconds,
                  begin: 0,
                  end: 1,
                  curve: Curves.easeInCirc,
                ),
          ],
        ),
      ).animate().custom(
            duration: 2.seconds,
            builder: (context, value, child) => ColoredBox(
              color: Color.lerp(begin, end, value) ?? begin,
              child: child,
            ),
          ),
    );
  }
}
