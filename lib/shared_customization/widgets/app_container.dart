import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final Widget child;
  final Border? border;
  final Alignment? alignment;
  final List<BoxShadow>? boxShadow;
  final BoxConstraints? constraints;
  final DecorationImage? image;

  const AppContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.gradient,
    this.borderRadius,
    this.child = const SizedBox.shrink(),
    this.border,
    this.alignment,
    this.boxShadow,
    this.constraints,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        image: image,
      ),
      child: child,
    );
  }
}
