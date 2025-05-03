import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedProgressBar extends StatefulWidget {
  final Color foregroundColor;
  final Color backgroundColor;
  final Duration duration;
  double value = 0;

  AnimatedProgressBar({
    Key? key,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.duration,
  }) : super(key: key);

  AnimationController? _controller;

  @override
  AnimatedProgressBarState createState() {
    return AnimatedProgressBarState();
  }

  void pauseAnimation() {
    _controller?.stop();
  }

  void resumeAnimation() {
    _controller?.forward();
  }
}

class AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> curve;
  late Tween<double> valueTween;

  @override
  void initState() {
    super.initState();

    widget._controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: widget._controller!,
      curve: Curves.easeInOut,
    );
    valueTween = Tween<double>(
      begin: 1,
      end: 0,
    );
    widget._controller!.forward();
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

      widget._controller!
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    widget._controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      builder: (context, child) {
        return LinearProgressIndicator(
          backgroundColor: widget.backgroundColor,
          valueColor: AlwaysStoppedAnimation(widget.foregroundColor),
          value: valueTween.evaluate(curve),
        );
      },
    );
  }
}
