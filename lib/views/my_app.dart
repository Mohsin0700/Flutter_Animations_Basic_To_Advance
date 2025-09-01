import 'package:basic_anim/controllers/advanced_animation_controller.dart';
import 'package:basic_anim/controllers/basic_animations_controller.dart';
import 'package:basic_anim/views/advanced_animations.dart';
import 'package:basic_anim/views/advanced_animations2.dart';
import 'package:basic_anim/views/basic_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Animations")),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: Text('Basic Animations'),
              onPressed: () {
                Get.put(BasicAnimationsController());
                Get.to(() => BasicAnimations());
              },
              label: Icon(Icons.arrow_right_alt),
            ),
            ElevatedButton.icon(
              icon: Text('Advanced Animations'),
              onPressed: () {
                Get.put(AdvancedAnimationController());
                Get.to(() => AdvancedAnimations());
              },
              label: Icon(Icons.arrow_right_alt),
            ),
            ElevatedButton.icon(
              icon: Text('Advanced Animations-2'),
              onPressed: () {
                Get.to(() => AdvancedAnimations2());
              },
              label: Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      ),
    );
  }
}
