import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/tweens/delay_tween.dart';

class CustomSpinKitThreeFading extends StatefulWidget {
  const CustomSpinKitThreeFading({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
    this.dotSpacing = 16,
  }) : super(key: key);

  final Color? color;
  final double size;
  final double dotSpacing;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _CustomSpinKitThreeFadingState createState() =>
      _CustomSpinKitThreeFadingState();
}

class _CustomSpinKitThreeFadingState extends State<CustomSpinKitThreeFading>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [-0.3, -0.2, -0.1];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size,
        child: Wrap(
          spacing: widget.dotSpacing,
          children: List.generate(3, (i) {
            return FadeTransition(
              opacity: DelayTween(begin: 0.4, end: 1.0, delay: delays[i])
                  .animate(_controller),
              child: SizedBox.fromSize(
                  size: Size.square(widget.size), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}
