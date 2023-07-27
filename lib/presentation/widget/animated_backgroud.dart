import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends HookWidget {
  const AnimatedBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Stack(
          children: [
            CustomAnimationBuilder<double>(
              tween: Tween(begin: size.width, end: size.width * -1),
              curve: Curves.linear,
              control: Control.loop,
              duration: const Duration(
                seconds: 40,
              ),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 50),
                  child: const Icon(
                    FontAwesomeIcons.cloud,
                    color: Colors.white,
                    size: 40,
                  ),
                );
              },
            ),
            CustomAnimationBuilder<double>(
              tween: Tween(begin: size.width, end: size.width * -1),
              curve: Curves.linear,
              control: Control.loop,
              duration: const Duration(
                seconds: 60,
              ),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: const Icon(
                    FontAwesomeIcons.cloud,
                    color: Colors.white,
                    size: 60,
                  ),
                );
              },
            ),
            CustomAnimationBuilder<double>(
              tween: Tween(begin: size.width, end: size.width * -1),
              curve: Curves.linear,
              control: Control.loop,
              duration: const Duration(
                seconds: 80,
              ),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 60),
                  child: Icon(
                    FontAwesomeIcons.cloud,
                    color: Colors.white.withOpacity(0.7),
                    size: 80,
                  ),
                );
              },
            ),
            CustomAnimationBuilder<double>(
              tween: Tween(begin: size.width, end: size.width * -1),
              curve: Curves.linear,
              control: Control.loop,
              duration: const Duration(
                seconds: 120,
              ),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(value, 60),
                  child: Icon(
                    FontAwesomeIcons.cloud,
                    color: Colors.white.withOpacity(0.9),
                    size: 120,
                  ),
                );
              },
            ),
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
