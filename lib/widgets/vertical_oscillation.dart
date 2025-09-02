import 'package:flutter/material.dart';

class VerticalOscillation extends StatefulWidget {
  const VerticalOscillation({super.key});

  @override
  State<VerticalOscillation> createState() => _VerticalOscillationState();
}

class _VerticalOscillationState extends State<VerticalOscillation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: child,
          );
        },
        child: FlutterLogo(
          size: 100,
          style: FlutterLogoStyle.stacked,
          textColor: Colors.red,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
