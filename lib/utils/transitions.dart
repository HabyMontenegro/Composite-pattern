import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TransitionWrapper extends StatelessWidget {
  final Widget child;
  const TransitionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
