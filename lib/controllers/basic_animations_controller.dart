import 'package:get/get.dart';

class BasicAnimationsController extends GetxController {
  RxDouble containerHeight = 200.0.obs;
  RxDouble containerWidth = 200.0.obs;
  RxDouble containerBorderWidth = 1.0.obs;
  RxDouble animatedOpacity = 0.0.obs;
  RxDouble containerBorderRadius = 0.0.obs;
  Duration containerSizeChangeDuration = const Duration(milliseconds: 500);
  Duration opacityDuration = const Duration(milliseconds: 2000);

  RxDouble containerSizeSliderVal = 1.0.obs;

  void changeContainerSize(double val) {
    containerHeight.value = (val + 1.0) * 100.0;
    containerWidth.value = (val + 1.0) * 100.0;
    update();
  }

  void changeContainerBorderWidth(double val) {
    containerBorderWidth.value = val;
  }

  void changeAnimatedOpacity() {
    animatedOpacity.value = 1.0;
    print(animatedOpacity.value);
  }

  void changeRadius(double val) {
    containerBorderRadius.value = val;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 100), () {
      changeAnimatedOpacity();
    });
  }

  @override
  void onClose() {
    super.onClose();
    animatedOpacity.close();
    containerHeight.close();
    containerWidth.close();
    containerBorderWidth.close();
    containerSizeSliderVal.close();
    animatedOpacity.value = 0.0;
    containerBorderRadius.close();
    Get.delete<BasicAnimationsController>();
  }
}
