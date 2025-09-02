import 'package:flutter/material.dart';

class Pendullum extends StatefulWidget {
  const Pendullum({super.key});

  @override
  State<Pendullum> createState() => _PendullumState();
}

class _PendullumState extends State<Pendullum>
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
      begin: -1,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(angle: _animation.value, child: child);
        },
        child: RotatedBox(
          quarterTurns: -1,
          child: FlutterLogo(size: 100, style: FlutterLogoStyle.values[0]),
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
