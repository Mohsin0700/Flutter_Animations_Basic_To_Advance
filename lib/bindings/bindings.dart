import 'package:basic_anim/controllers/advanced_animation_controller.dart';
import 'package:basic_anim/controllers/basic_animations_controller.dart';
import 'package:get/get.dart';

class AnimationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicAnimationsController());
    Get.lazyPut(() => AdvancedAnimationController());
  }
}
