import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _colorAnimation;
  Animation? _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller!);

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 60), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 30), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 60), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 30), weight: 50),
    ]).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, _) => IconButton(
        icon: Icon(
          Icons.favorite,
          color: _colorAnimation!.value,
          size: _sizeAnimation!.value,
        ),
        onPressed: () {
          if (_controller!.isCompleted) {
            _controller!.reset();
          } else {
            _controller!.forward();
          }
        },
      ),
    );
  }
}
