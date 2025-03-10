// ignore_for_file: unnecessary_null_comparison, unnecessary_type_check

import 'dart:math' as math show sin, pi;

import 'package:flutter/widgets.dart';

class DelayTween extends Tween<double> {
  DelayTween({
    double? begin,
    double? end,
    required this.delay,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class ThreeBounce extends StatefulWidget {
  const ThreeBounce({
    Key? key,
    required this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1000),
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;

  @override
  State<ThreeBounce> createState() => _ThreeBounceState();
}

class _ThreeBounceState extends State<ThreeBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleCtrl;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _circle(0, .0),
            _circle(1, .2),
            _circle(2, .4),
          ],
        ),
      ),
    );
  }

  Widget _circle(int index, double delay) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _size = widget.size * 0.5;
    return ScaleTransition(
      scale: DelayTween(begin: 0.0, end: 1.0, delay: delay).animate(_scaleCtrl),
      child: SizedBox.fromSize(
        size: Size.square(_size),
        child: _itemBuilder(index),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return widget.itemBuilder != null
        ? widget.itemBuilder!(context, index)
        : DecoratedBox(
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          );
  }
}
