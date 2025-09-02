import 'package:flutter/material.dart';

class AdvancedAnimations3 extends StatefulWidget {
  const AdvancedAnimations3({super.key});

  @override
  State<AdvancedAnimations3> createState() => _AdvancedAnimations3State();
}

class _AdvancedAnimations3State extends State<AdvancedAnimations3>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _animation2;
  late AnimationController _controller;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _animation = Tween<double>(
      begin: 20,
      end: 400,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _animation2 = Tween<double>(begin: 100, end: 400).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: const Interval(0.15, 1.0, curve: Curves.easeInOut),
      ),
    );
    _controller.repeat(reverse: true);
    _controller2.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Animations 3')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // My Custom Work
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lime,
                      ),
                      height: 50,
                      width: _animation.value,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(90),
              ),
              child: AnimatedBuilder(
                animation: _animation2,
                builder: (context, child) {
                  return RotatedBox(
                    quarterTurns: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.orangeAccent,
                        ),
                        height: 200,
                        width: _animation2.value,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
