import 'package:basic_anim/widgets/pinpong.dart';
import 'package:flutter/material.dart';

class AdvancedAnimations4 extends StatefulWidget {
  const AdvancedAnimations4({super.key});

  @override
  State<AdvancedAnimations4> createState() => _AdvancedAnimations4State();
}

class _AdvancedAnimations4State extends State<AdvancedAnimations4>
    with TickerProviderStateMixin {
  final List<Widget> myWidgets = [Pinpong()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Animations 4')),
      body: GridView.builder(
        itemCount: myWidgets.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return myWidgets[index];
        },
      ),
    );
  }
}
