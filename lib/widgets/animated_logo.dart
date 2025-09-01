import 'package:flutter/widgets.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    super.key,
    required super.listenable,
    required Animation<double> animation,
  });

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
