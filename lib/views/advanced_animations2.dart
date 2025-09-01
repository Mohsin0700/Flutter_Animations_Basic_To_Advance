import 'package:flutter/material.dart';

class AdvancedAnimations2 extends StatefulWidget {
  const AdvancedAnimations2({super.key});

  @override
  State<AdvancedAnimations2> createState() => _AdvancedAnimations2State();
}

class _AdvancedAnimations2State extends State<AdvancedAnimations2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 300.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Animation 2')),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: _animation.value,
        width: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
