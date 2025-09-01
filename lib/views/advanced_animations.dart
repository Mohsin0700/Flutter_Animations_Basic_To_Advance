import 'package:basic_anim/widgets/animated_logo.dart';
import 'package:flutter/material.dart';

class AdvancedAnimations extends StatefulWidget {
  const AdvancedAnimations({super.key});

  @override
  State<AdvancedAnimations> createState() => _AdvancedAnimationsState();
}

class _AdvancedAnimationsState extends State<AdvancedAnimations>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        print('Status $status');
      });
    controller.forward();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("Advanced Animations")),
  //     body: Center(
  //       child: Container(
  //         margin: const EdgeInsets.symmetric(vertical: 10),
  //         height: animation.value,
  //         width: animation.value,
  //         child: const FlutterLogo(),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) =>
      AnimatedLogo(animation: animation, listenable: animation);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
