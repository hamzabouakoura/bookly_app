import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sliding_text_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSliding();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          kPrimaryLogo,
          height: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        SlidingTextAnimation(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRouter.kHomeView);
    });
  }

  void initSliding() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
