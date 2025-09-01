import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/basic_animations_controller.dart';

class BasicAnimations extends GetView<BasicAnimationsController> {
  const BasicAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(BasicAnimationsController());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Basic Animations")),
      body: Container(
        padding: EdgeInsets.only(top: 100, right: 20),
        width: screenWidth,
        child: Column(
          children: [
            Obx(() {
              return AnimatedOpacity(
                curve: Easing.legacy,
                opacity: ctrl.animatedOpacity.value,
                duration: ctrl.opacityDuration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Slider for changing box size
                    RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        value: ctrl.containerSizeSliderVal.value,
                        onChanged: (val) {
                          ctrl.containerSizeSliderVal.value = val;
                          ctrl.changeContainerSize(val);
                        },
                      ),
                    ),
                    // Three add boxed for border width
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            ctrl.changeContainerBorderWidth(1);
                          },
                          icon: Icon(Icons.add_box, size: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            ctrl.changeContainerBorderWidth(10);
                          },
                          icon: Icon(Icons.add_box, size: 35),
                        ),
                        IconButton(
                          onPressed: () {
                            ctrl.changeContainerBorderWidth(20);
                          },
                          icon: Icon(Icons.add_box, size: 50),
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ctrl.containerBorderRadius.value,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: ctrl.containerBorderWidth.value,
                        ),
                        color: Colors.greenAccent,
                      ),
                      duration: ctrl.containerSizeChangeDuration,
                      width: ctrl.containerWidth.value,
                      height: ctrl.containerHeight.value,
                    ),
                  ],
                ),
              );
            }),
            Divider(),
            Obx(() {
              return AnimatedOpacity(
                duration: ctrl.opacityDuration,
                opacity: ctrl.animatedOpacity.value,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        ctrl.changeRadius(90);
                      },
                      icon: Icon(
                        Icons.circle_outlined,
                        size: 50,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ctrl.changeRadius(0);
                      },
                      icon: Icon(
                        Icons.square_outlined,
                        size: 50,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
