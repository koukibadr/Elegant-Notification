import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedProgressBar extends StatefulWidget {
  final Color foregroundColor;
  final int duration;
  double value = 0;

  AnimatedProgressBar({
    Key? key,
    required this.foregroundColor,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedProgressBarState createState() {
    return _AnimatedProgressBarState();
  }
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> curve;
  late Tween<double> valueTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    valueTween = Tween<double>(
      begin: 1,
      end: 0,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      double beginValue = valueTween.evaluate(curve);
      valueTween = Tween<double>(
        begin: beginValue,
        end: widget.value,
      );

      _controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      builder: (context, child) {
        return LinearProgressIndicator(
          backgroundColor: greyColor,
          valueColor: AlwaysStoppedAnimation(widget.foregroundColor),
          value: valueTween.evaluate(curve),
        );
      },
    );
  }
}
