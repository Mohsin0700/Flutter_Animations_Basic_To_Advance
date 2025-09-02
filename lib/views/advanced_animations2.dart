import 'package:flutter/material.dart';

class AdvancedAnimations2 extends StatefulWidget {
  const AdvancedAnimations2({super.key});

  @override
  State<AdvancedAnimations2> createState() => _AdvancedAnimations2State();
}

class _AdvancedAnimations2State extends State<AdvancedAnimations2>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(
      begin: 50.0,
      end: 100.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Animation 2')),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
