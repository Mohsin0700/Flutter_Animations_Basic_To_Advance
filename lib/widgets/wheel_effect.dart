import 'package:flutter/material.dart';

class WheelEffect extends StatefulWidget {
  const WheelEffect({super.key});

  @override
  State<WheelEffect> createState() => _WheelEffectState();
}

class _WheelEffectState extends State<WheelEffect>
    with SingleTickerProviderStateMixin {
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
      begin: 0,
      end: 2 * 3.14,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(angle: _animation.value, child: child);
        },
        child: FlutterLogo(size: 100, style: FlutterLogoStyle.values[0]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
