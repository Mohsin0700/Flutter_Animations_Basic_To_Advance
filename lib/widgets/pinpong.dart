import 'package:flutter/material.dart';

class Pinpong extends StatefulWidget {
  const Pinpong({super.key});

  @override
  State<Pinpong> createState() => _PinpongState();
}

class _PinpongState extends State<Pinpong> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 50.0,
      end: 100.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: _animation.value,
            width: _animation.value,
            child: child,
          );
        },
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
