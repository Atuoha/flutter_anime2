import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeInCirc,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Padding(
          padding: EdgeInsets.only(top: value * 20.0),
          child: child,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
