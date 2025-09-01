import 'package:basic_anim/controllers/advanced_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedAnimations extends GetView<AdvancedAnimationController> {
  const AdvancedAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AdvancedAnimationController());
    return Scaffold(
      appBar: AppBar(title: Text("Advanced Animations")),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Obx(
          () => Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(border: Border.all()),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: ctrl.progressVal.value),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                print('Value is $value');
                return Container(
                  height: 50,
                  width: value,
                  color: Colors.greenAccent,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
