import 'package:flutter/material.dart';

class FadeInOut extends StatelessWidget {
  final Widget child;
  final bool visible;

  const FadeInOut({Key? key, required this.visible, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 10),
        opacity: visible == true ? 1.0 : 0.0,
        child: child);
  }
}
